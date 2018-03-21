From: Julien Grall <julien.grall@arm.com>
Subject: Re: [for-4.11][PATCH v6 01/16] x86/mm: skip
 incrementing mfn if it is not a valid mfn
Date: Wed, 21 Mar 2018 23:03:24 +0000
Message-ID: <dc9561db-c48a-ee14-4fde-a71c13d4f8e8@arm.com>
References: <20180321044737.20794-1-julien.grall@arm.com>
 <20180321044737.20794-2-julien.grall@arm.com>
 <5AB2761502000078001B4788@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AB2761502000078001B4788@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8yMS8yMDE4IDAyOjExIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMS4w
My4xOCBhdCAwNTo0NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gRnJvbTogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4KPj4gSW4gYSBmb2xsb3ctdXAgcGF0Y2hlcywg
c29tZSBjYWxsZXJzIHdpbGwgYmUgc3dpdGNoZWQgdG8gcGFzcwo+PiBJTlZBTElEX01GTiBpbnN0
ZWFkIG9mIHplcm8gZm9yIG5vbi1wcmVzZW50IG1hcHBpbmdzLiBTbyBza2lwCj4+IGluY3JlbWVu
dGluZyBtZm4gaWYgaXQgaXMgbm90IGEgdmFsaWQgb25lLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBbUmV3b3JrIHRoZSBjb21taXQgbWVzc2FnZV0K
PiAKPiBXaGVyZSBkaWQgbXkKPiAKPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IGdvPwoKSSBjb25zaWRlcmVkIHRoZSByZXdvcmRpbmcgYXMgYSByZWFz
b24gdG8gZHJvcCB0aGUgdGFncy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
