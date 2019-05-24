From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 27/50] x86emul: support AVX512{F,
 ER} reciprocal insns
Date: Fri, 24 May 2019 21:48:44 +0100
Message-ID: <7c71228d-4b60-73e8-e7a9-98f430c6d8a7@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84A8020000780021F23F@prv1-mh.provo.novell.com>
 <bf91ae8b-33f8-ee85-ff39-44e8ccc29f60@citrix.com>
 <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUH7R-0002Bv-P8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 20:48:49 +0000
In-Reply-To: <5CE792AA0200007800231E09@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMjAxOSAwNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMDUuMTkg
YXQgMTg6MTUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTUvMDMv
MjAxOSAxMDo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBbHNvIGluY2x1ZGUgdGhlIG9ubHkg
b3RoZXIgQVZYNTEyRVIgaW5zbiBwYWlyLCBWRVhQMlB7RCxTfS4KPj4+Cj4+PiBOb3RlIHRoYXQg
ZGVzcGl0ZSB0aGUgcmVwbGFjZW1lbnQgb2YgdGhlIFNIQSBpbnNucycgdGFibGUgc2xvdHMgdGhl
cmUncwo+Pj4gbm8gbmVlZCB0byBzcGVjaWFsIGNhc2UgdGhlaXIgZGVjb2Rpbmc6IFRoZWlyIGlu
c24tc3BlY2lmaWMgY29kZSBhbHJlYWR5Cj4+PiBzZXRzIG9wX2J5dGVzIChhcyB3YXMgcmVxdWly
ZWQgZHVlIHRvIHNpbWRfb3RoZXIpLCBhbmQgVHdvT3AgaXMgb2Ygbm8KPj4+IHJlbGV2YW5jZSBm
b3IgbGVnYWN5IGVuY29kZWQgU0lNRCBpbnNucy4KPj4+Cj4+PiBUaGUgcmFpc2luZyBvZiAjVUQg
d2hlbiBFVkVYLkwnTCBpcyAzIGZvciBBVlg1MTJFUiBzY2FsYXIgaW5zbnMgaXMgZG9uZQo+Pj4g
dG8gYmUgb24gdGhlIHNhZmUgc2lkZS4gVGhlIFNETSBkb2VzIG5vdCBjbGFyaWZ5IGJlaGF2aW9y
IHRoZXJlLCBhbmQKPj4+IGl0J3MgZXZlbiBtb3JlIGFtYmlndW91cyBoZXJlICh3aXRob3V0IEFW
WDUxMlZMIGluIHRoZSBwaWN0dXJlKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+IFRoYW5rcywgYWxzbyBmb3IgdGhlIG90aGVycy4KPgo+PiBT
ZWVpbmcgYXMgSSBoYXZlIHNvbWUgRVIgaGFyZHdhcmUsIGlzIHRoZXJlIGFuIGVhc3kgd2F5IHRv
IGdldAo+PiBHQ0MvYmludXRpbHMgdG8gZW1pdCBhIHdlaXJkIEwnTCBmaWVsZCwgb3Igd2lsbCB0
aGlzIGludm9sdmUgc29tZSBtYW51YWwKPj4gb3Bjb2RlIGdlbmVyYXRpb24gdG8gdGVzdD8KPiBn
Y2MgZG9lcyBub3QgcHJvdmlkZSBhbnkgY29udHJvbCBhdCBhbGwsIGFmYWljdC4gYmludXRpbHMg
YWxsb3dzICJ3ZWlyZCIKPiBWRVguTCBvciBFVkVYLkwnTCBvbmx5IGZvciBpbnNucyBpdCBiZWxp
ZXZlcyBpZ25vcmUgdGhhdCBmaWVsZC4gU28geWVzLAo+IEknbSBhZnJhaWQgdGhpcyB3aWxsIGlu
dm9sdmUgdXNpbmcgLmJ5dGUuCgpPay7CoCBHaXZlbiBhIHRlc3QgcHJvZ3JhbSBvZjoKCnsKcHJp
bnRmKCJSZWFsOlxuIik7CmFzbSB2b2xhdGlsZSAoInZyY3AxNHNkICV4bW0wLCV4bW0wLCV4bW0w
Iik7CgpwcmludGYoIkJ5dGVzOlxuIik7CmFzbSB2b2xhdGlsZSAoIi5ieXRlIDB4NjIsIDB4ZjIs
IDB4ZmQsIDB4MDgsIDB4NGQsIDB4YzAiKTsKCnByaW50ZigiQmFkIDB4Mjg6XG4iKTsKYXNtIHZv
bGF0aWxlICgiLmJ5dGUgMHg2MiwgMHhmMiwgMHhmZCwgMHgyOCwgMHg0ZCwgMHhjMCIpOwoKcHJp
bnRmKCJCYWQgMHg0ODpcbiIpOwphc20gdm9sYXRpbGUgKCIuYnl0ZSAweDYyLCAweGYyLCAweGZk
LCAweDQ4LCAweDRkLCAweGMwIik7CgpwcmludGYoIkJhZCAweDY4OlxuIik7CmFzbSB2b2xhdGls
ZSAoIi5ieXRlIDB4NjIsIDB4ZjIsIDB4ZmQsIDB4NjgsIDB4NGQsIDB4YzAiKTsKfQoKVGhlbiB0
aGUgTCdMID0gMyBjYXNlICgweDY4IGF0IHRoZSBlbmQpIGRvZXMgaW5kZWVkIHRha2UgI1VEIGZv
ciBib3RoCktOTCBhbmQgS05NLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
