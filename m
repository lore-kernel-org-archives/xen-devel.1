From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: domains do not shutdown properly with current
 staging
Date: Thu, 16 May 2019 10:19:28 +0100
Message-ID: <20190516091928.GE3977@zion.uk.xensource.com>
References: <20190516111514.79e72bfc.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dWcr=TQ=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hRCY2-0006iz-CK
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:19:34 +0000
Content-Disposition: inline
In-Reply-To: <20190516111514.79e72bfc.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MTU6MTRBTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gV2hpbGUgcHJlcGFyaW5nIHRoZSByZWNlbnQgYl9pbmZvLT5kZXZpY2VfbW9kZWxfdmVy
c2lvbiBjaGFuZ2UgYWxsIG15IHRlc3RpbmcKPiB3ZW50IGZpbmUuIEJ1dCBub3cgd2l0aCAiMjAx
OS0wNS0xNSAxNjoxOTo1NyArMDEwMCBnaXQ6MmE1NTZiNjNhMiIgYWxsIGRvbVVzCj4gKFBWL0hW
TSB3aXRoIGFuZCB3aXRob3V0IGRldmljZSBtb2RlbCkgZG8gbm90IGZpbmlzaCBzaHV0ZG93bjoK
PiAKPiBOYW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgSUQgICBNZW0gVkNQVXMgICBTdGF0
ZSAgIFRpbWUocykKPiBEb21haW4tMCAgICAgICAgICAgICAgICAgICAgICAgIDAgIDMwNzIgICAg
IDQgICAgIHItLS0tLSAgICAgMjUzLjAKPiBwdl9zbGUxMnNwMl9jX3Fjb3cyICAgICAgICAgICAg
IDEgICA4ODggICAgIDIgICAgIC0tcHMtLSAgICAgIDgyLjkKPiBwdl9zbGUxMnNwMl9jX3JhdyAg
ICAgICAgICAgICAgIDIgICA4ODggICAgIDIgICAgIC0tcHMtLSAgICAgIDg2LjgKPiBmdl9zbGUx
MnNwMl9jX3JhdyAgICAgICAgICAgICAgIDMgICA4ODAgICAgIDEgICAgIC0tcHMtLSAgICAgIDIw
LjgKPiBmdl9zbGUxMnNwMl9jX3Fjb3cyICAgICAgICAgICAgIDQgICA4ODAgICAgIDEgICAgIC0t
cHMtLSAgICAgMTUwLjkKPiAKPiBJcyBhbnlvbmUgZWxzZSBzZWVpbmcgdGhhdD8KClNlZSBteSBw
YXRjaCBuYW1lZAoKIGxpYnhsOiBmaXggcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGluIDVjODgzY2Yw
MzZjZgoKV2VpLgoKPiAKPiBPbGFmCgoKCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
