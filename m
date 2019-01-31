From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v7 14/15] xsm,
 argo: notify: don't describe rings that cannot be sent to
Date: Wed, 30 Jan 2019 20:28:19 -0800
Message-ID: <1548908900-1128-15-git-send-email-christopher.w.clark@gmail.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3yW-0008FF-LS
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:29:16 +0000
Received: by mail-io1-xd44.google.com with SMTP id l14so1521890ioj.5
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:29:15 -0800 (PST)
In-Reply-To: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KQWNrZWQtYnk6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2Eu
Z292PgpUZXN0ZWQtYnk6IENocmlzIFBhdHRlcnNvbiA8cGF0dGVyc29uY0BhaW5mb3NlYy5jb20+
Ci0tLQp2MyAjMTAgUm9nZXI6IGRyb3Agb3V0IGxhYmVsLCB1c2UgcmV0dXJuIC1FRkFVTFQgaW4g
ZmlsbF9yaW5nX2RhdGEKdjM6IEFkZCBEYW5pZWwncyBBY2tlZC1ieQoKIHhlbi9jb21tb24vYXJn
by5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4vY29tbW9uL2FyZ28uYwppbmRleCA0
NDIyOGQ1Li4xN2FkNjY3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2FyZ28uYworKysgYi94ZW4v
Y29tbW9uL2FyZ28uYwpAQCAtMTMzNSw2ICsxMzM1LDE3IEBAIGZpbGxfcmluZ19kYXRhKGNvbnN0
IHN0cnVjdCBkb21haW4gKmN1cnJkLAogICAgIGlmICggIWRzdF9kIHx8ICFkc3RfZC0+YXJnbyAp
CiAgICAgICAgIGdvdG8gb3V0OwogCisgICAgLyoKKyAgICAgKiBEb24ndCBzdXBwbHkgaW5mb3Jt
YXRpb24gYWJvdXQgcmluZ3MgdGhhdCBhIGd1ZXN0IGlzIG5vdAorICAgICAqIGFsbG93ZWQgdG8g
c2VuZCB0by4KKyAgICAgKi8KKyAgICByZXQgPSB4c21fYXJnb19zZW5kKGN1cnJkLCBkc3RfZCk7
CisgICAgaWYgKCByZXQgKQorICAgIHsKKyAgICAgICAgcHV0X2RvbWFpbihkc3RfZCk7CisgICAg
ICAgIHJldHVybiByZXQ7CisgICAgfQorCiAgICAgcmVhZF9sb2NrKCZkc3RfZC0+YXJnby0+cmlu
Z3NfTDJfcndsb2NrKTsKIAogICAgIHJpbmdfaW5mbyA9IGZpbmRfcmluZ19pbmZvX2J5X21hdGNo
KGRzdF9kLCBlbnQucmluZy5hcG9ydCwKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
