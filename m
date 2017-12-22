From: Sergej Proskurin <proskurin@sec.in.tum.de>
Subject: Re: Xen Performance Results
Date: Fri, 22 Dec 2017 11:41:17 +0100
Message-ID: <7239ec0a-3b79-5adf-6a76-09b0b9db86e4@sec.in.tum.de>
References: <26c3d0d6-8e01-9c39-d765-faedcfb7ed67@sec.in.tum.de>
 <022e41dc-0d9f-0d95-956b-1676b87c2c2d@sec.in.tum.de>
 <CAFLBxZbKHg0Zp+HDLTqkc2uUkcCZSj6=Fw0oobnOzFFQyQgyPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qavo=ds=sec.in.tum.de=proskurin@srs-us1.protection.inumbo.net>)
 id 1eSKlf-0000GU-5W
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2017 10:41:31 +0000
In-Reply-To: <CAFLBxZbKHg0Zp+HDLTqkc2uUkcCZSj6=Fw0oobnOzFFQyQgyPw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLAoKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKT24gMTIvMjIvMjAxNyAxMToy
NiBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiBUaHUsIERlYyAyMSwgMjAxNyBhdCAyOjQy
IFBNLCBTZXJnZWogUHJvc2t1cmluCj4gPHByb3NrdXJpbkBzZWMuaW4udHVtLmRlPiB3cm90ZToK
Pj4gSGkgYWxsLAo+Pgo+PiBGb3IgdGhlIHNha2Ugb2YgY29tcGxldGVuZXNzOiB0aGUgc29sdXRp
b24gdG8gdGhlIGlzc3VlIHN0YXRlZCBpbiBteQo+PiBsYXN0IGVtYWlsIHdhcyBkZWFjdGl2YXRp
bmcgSW50ZWwncyBUdXJibyBCb29zdCB0ZWNobm9sb2d5IGRpcmVjdGx5IGluCj4+IFVFRkkgKGRl
YWN0aXZhdGluZyBUdXJibyBCb29zdCB0aHJvdWdoIHhlbnBtIHdhcyBub3QgZW5vdWdoKS4gQXBw
YXJlbnRseQo+PiBUdXJibyBCb29zdCBhZmZlY3RzIExpbnV4IGFuZCBLVk0gZGlmZmVyZW50bHkg
dGhhbiBYZW4sIHdoaWNoIGxlZCB0byB0aGUKPj4gcGhvbm9tZW5vbiwgaW4gd2hpY2ggdGhlIGJl
bmNobWFyayBleGVjdXRpb24gb24gWGVuIGFwcGVhcmVkIGZhc3RlciB0aGFuCj4+IG9uIGJhcmUg
bWV0YWwuCj4gCj4gKkFwcGVhcmVkKiBmYXN0ZXIgdGhhbiBvbiBiYXJlIG1ldGFsLCBvciAqd2Fz
KiBmYXN0ZXIgdGhhbiBvbiBiYXJlIG1ldGFsPwo+IAo+IElmIHRoZSBzb3VyY2Ugb2YgdGhlIGNo
YW5nZSB3YXMgdGhlIFR1cmJvIEJvb3N0LCBpdCdzIGVudGlyZWx5Cj4gcG9zc2libGUgdGhhdCB0
aGUgZGlmZmVyZW5jZSBpcyBkdWUgdG8gdGhlIHBsYWNlbWVudCBvZiB3b3JrZXJzIG9uCj4gY3B1
cyAtLSBpLmUuLCB0aGF0IExpbnV4J3MgYmFyZSBtZXRhbCBzY2hlZHVsZXIgbWFrZXMgYSB3b3Jz
ZSBjaG9pY2UKPiBmb3IgdGhpcyBwYXJ0aWN1bGFyIHdvcmtsb2FkIHRoYW4gWGVuJ3Mgc2NoZWR1
bGVyIGRvZXMuCj4gCgpHaXZlbiB0aGUgZmFjdCB0aGF0IGZvciB0aGlzIHBhcnRpY3VsYXIgYmVu
Y2htYXJrIEkgY29uZmlndXJlZCBib3RoIGRvbTAKYW5kIGRvbXUgdG8gdXNpbmcgb25seSBvbmUg
Y29yZSAoaW4gZmFjdCBJIGhhdmUgcGlubmVkIGJvdGggZG9tYWlucyB0bwp0aGUgc2FtZSBwaHlz
aWNhbCBjb3JlKSwgSSBkbyBub3QgYmVsaWV2ZSB0aGF0IHRoZSBwZXJmb3JtYW5jZSBpbmNyZWFz
ZQp3YXMgZHVlIHRvIGEgYmV0dGVyIHBsYWNlbWVudCBvbiBhbGwgYXZhaWxhYmxlIENQVSdzLiBI
b3dldmVyLCBJCmFic29sdXRlbHkgYWdyZWUgdGhhdCB0aGVyZSBtaWdodCBiZSBhIGRpZmZlcmVu
Y2UgaW4gaGFuZGxpbmcgVHVyYm8KQm9vc3RzIGJldHdlZW4gTGludXggYW5kIFhlbi4KClRoYW5r
cywKflNlcmdlagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
