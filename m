From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 1/3] vpci/msi: fix unbind loop
Date: Tue, 15 May 2018 15:10:06 +0100
Message-ID: <20180515141008.69320-2-roger.pau@citrix.com>
References: <20180515141008.69320-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zhs+=ic=citrix.com=prvs=666baa678=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fIafF-0003fe-Kz
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 14:10:53 +0000
In-Reply-To: <20180515141008.69320-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGN1cnJlbnQgdW5iaW5kIGxvb3Agb24gZmFpbHVyZSBpbiB2cGNpX21zaV9lbmFibGUgaXMg
d3JvbmcgYW5kCndpbGwgb25seSB3b3JrIGNvcnJlY3RseSBpZiB0aGUgaW5pdGlhbCBwaXJxIGlz
IDAuIEZpeCB0aGlzIGJ5IGFkZGluZwphIHByb3BlciBib3VuZC4KClJlcG9ydGVkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQogeGVuL2FyY2gveDg2L2h2bS92bXNpLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zt
c2kuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCmluZGV4IDkwMGQ0ZjY3ZDQuLjVhYjczODdk
NzggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm1zaS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm1zaS5jCkBAIC03MTAsNyArNzEwLDcgQEAgc3RhdGljIGludCB2cGNpX21zaV9lbmFi
bGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQzMl90IGRhdGEsCiAgICAgICAgICAg
ICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXU6IGZhaWxlZCB0byBiaW5kIFBJUlEgJXU6ICVk
XG4iLAogICAgICAgICAgICAgICAgICAgICAgcGRldi0+c2VnLCBwZGV2LT5idXMsIFBDSV9TTE9U
KHBkZXYtPmRldmZuKSwKICAgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZu
KSwgcGlycSArIGksIHJjKTsKLSAgICAgICAgICAgIHdoaWxlICggYmluZC5tYWNoaW5lX2lycS0t
ICkKKyAgICAgICAgICAgIHdoaWxlICggYmluZC5tYWNoaW5lX2lycS0tID4gcGlycSApCiAgICAg
ICAgICAgICAgICAgcHRfaXJxX2Rlc3Ryb3lfYmluZChwZGV2LT5kb21haW4sICZiaW5kKTsKICAg
ICAgICAgICAgIHNwaW5fbG9jaygmcGRldi0+ZG9tYWluLT5ldmVudF9sb2NrKTsKICAgICAgICAg
ICAgIHVubWFwX2RvbWFpbl9waXJxKHBkZXYtPmRvbWFpbiwgcGlycSk7Ci0tIAoyLjE3LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
