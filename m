From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/pv: Code improvements to
 do_update_descriptor()
Date: Mon, 10 Dec 2018 07:18:27 -0700
Message-ID: <5C0E75B30200007800204B2B@prv1-mh.provo.novell.com>
References: <1544119435-15037-3-git-send-email-andrew.cooper3@citrix.com>
 <1544450805-13292-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1544450805-13292-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

ID4+PiBPbiAxMC4xMi4xOCBhdCAxNTowNiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+ICogQWRkICJ1aW50NjRfdCByYXciIHRvIHNlZ19kZXNjX3QgdG8gcmVtb3ZlIHRoZSBv
cGVuY29kZWQgdWludDY0X3QgY2FzdGluZwo+ICAgIGluIHRoaXMgZnVuY3Rpb24uICBDaGFuZ2Ug
dGhlIHBhcmFtZXRlciB0byBiZSBvZiB0eXBlIHNlZ19kZXNjX3QuCj4gICogUmVuYW1lIHRoZSAn
cGEnIHBhcmFtZXRlciB0byAnZ2FkZHInLCBiZWNhdXNlIGl0IGxpdmVzIGluIEdGTiBzcGFjZSBy
YXRoZXIKPiAgICB0aGFuIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuCj4gICogVXNlIGdmbl90IGFu
ZCBtZm5fdCByYXRoZXIgdGhhbiB1bnNpZ25lZCBsb25ncy4KPiAgKiBDaGVjayB0aGUgYWxpZ25t
ZW50IGFuZCBwcm9wb3NlZCBuZXcgZGVzY3JpcHRvciBiZWZvcmUgdGFraW5nIGEgcGFnZQo+ICAg
IHJlZmVyZW5jZS4KPiAgKiBSZXVzZSB0aGUgb3V0IGxhYmVsIGZvciBhbGwgZXhpdCBwYXRocy4K
PiAgKiBVc2UgdGhlIG1vcmUgZmxleGlibGUgQUNDRVNTX09OQ0UoKSBhY2Nlc3NvciBpbiBwcmVm
ZXJlbmNlIHRvCj4gICAgd3JpdGVfYXRvbWljKCkKPiAKPiBObyBleHBlY3RlZCBjaGFuZ2UgaW4g
YmVoYXZpb3VyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5j
b20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
