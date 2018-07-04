From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 06/13] libx86: Introduce a helper to
 serialise a cpuid_policy object
Date: Wed, 4 Jul 2018 09:42:39 +0100
Message-ID: <20180704084239.fk7cianiscggg3sz@citrix.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1530651326-5320-7-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMDMsIDIwMTggYXQgMDk6NTU6MTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgc2VyaWFsaXNlZCBmb3JtIGlzIG1hZGUgdXAgb2YgdGhlIGxlYWYsIHN1Ymxl
YWYgYW5kIGRhdGEgdHVwbGUuICBBcyB0aGlzCj4gaXMgdGhlIGFyY2hpdGVjdHVyYWwgZm9ybSwg
aXQgaXMgZXhwZWN0ZWQgbm90IHRvIGNoYW5nZSBnb2luZyBmb3J3YXJkcy4KPiAKPiB4ODZfY3B1
aWRfY29weV90b19idWZmZXIoKSBpcyBpbXBsZW1lbnRlZCB1c2luZyBYZW4ncyByZWd1bGFyIGNv
cHlfdG9fZ3Vlc3QKPiBwcmltaXRpdmVzLCB3aXRoIGFuIEFQSS1jb21wYXRpYmxlIG1lbWNweSgp
IGlzIHVzZWQgZm9yIHRoZSBsaWJ4YyBoYWxmIG9mIHRoZQo+IGJ1aWxkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClsuLi5dCj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni94ZW4uaCBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9hcmNoLXg4Ni94ZW4uaAo+IGluZGV4IDY5ZWU0YmMuLmYzYmRkODMgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L3hlbi5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUvcHVibGljL2FyY2gteDg2L3hlbi5oCj4gQEAgLTMxNCw2ICszMTQsMTcgQEAgc3RydWN0
IHhlbl9hcmNoX2RvbWFpbmNvbmZpZyB7Cj4gICNkZWZpbmUgWEVOX0FDUElfR1BFMF9DUFVIUF9C
SVQgICAgICAyCj4gICNlbmRpZgo+ICAKPiArLyoKPiArICogUmVwcmVzZW50YXRpb25zIG9mIGFy
Y2hpdGVjdHVyYWwgQ1BVSUQgaW5mb3JtYXRpb24uICBVc2VkIGFzIHRoZQo+ICsgKiBzZXJpYWxp
c2VkIHZlcnNpb24gb2YgWGVuJ3MgaW50ZXJuYWwgcmVwcmVzZW50YXRpb24uCj4gKyAqLwo+ICt0
eXBlZGVmIHN0cnVjdCB4ZW5fY3B1aWRfbGVhZiB7Cj4gKyNkZWZpbmUgWEVOX0NQVUlEX05PX1NV
QkxFQUYgMHhmZmZmZmZmZnUKPiArICAgIHVpbnQzMl90IGxlYWYsIHN1YmxlYWY7Cj4gKyAgICB1
aW50MzJfdCBhLCBiLCBjLCBkOwo+ICt9IHhlbl9jcHVpZF9sZWFmX3Q7Cj4gK0RFRklORV9YRU5f
R1VFU1RfSEFORExFKHhlbl9jcHVpZF9sZWFmX3QpOwo+ICsKCklzIHB1dHRpbmcgdGhpcyBpbiBw
dWJsaWMgaGVhZGVyIHdoaWxlIGxlYXZpbmcKQ1BVSURfTUFYX1NFUklBTElTRURfTEVBVkVTIGlu
IGEgcHJpdmF0ZSBoZWFkZXIgdXNlZnVsPwoKSG93IGRvZXMgYW4gZXh0ZXJuYWwgdXNlciBrbm93
IGhvdyBiaWcgYSBidWZmZXIgaXQgbmVlZHMgdG8gcHJvdmlkZSB0bwphY2NvbW1vZGF0ZSB0aGUg
cmV0dXJuIHN0cnVjdHVyZT8KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
