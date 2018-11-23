From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] tools/ocaml: cleanup to reduce compiler
 warnings [and 1 more messages]
Date: Fri, 23 Nov 2018 15:00:12 +0000
Message-ID: <5f80f03b-28fd-465c-4565-38d54b7f3c5d@citrix.com>
References: <20181114110650.7179-1-christian.lindig@citrix.com>
 <82c8c19d-088c-65d7-ff76-a7017db204bd@citrix.com>
 <20181114113611.r7s7mofncp53mvfb@zion.uk.xensource.com>
 <23544.5439.358683.926752@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zeqx=oc=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQCwd-0003vA-6V
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 15:00:35 +0000
In-Reply-To: <23544.5439.358683.926752@mariner.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxNDo1NywgSWFuIEphY2tzb24gd3JvdGU6Cj4gV2VpIExpdSB3cml0ZXMg
KCJSZTogW1BBVENIIDEvMV0gdG9vbHMvb2NhbWw6IGNsZWFudXAgdG8gcmVkdWNlIGNvbXBpbGVy
IHdhcm5pbmdzIik6Cj4+IE9uIFdlZCwgTm92IDE0LCAyMDE4IGF0IDExOjA2OjQ5QU0gKzAwMDAs
IENocmlzdGlhbiBMaW5kaWcgd3JvdGU6Cj4+PiBUaGlzIGNvbW1pdCBjbGVhbnMgdXAgY29kZSB0
byByZWR1Y2UgY29tcGlsZXIgd2FybmluZ3M6Cj4gLi4uCj4+IEFja2VkLWJ5OiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+Pgo+PiBWZXJ5IG5pY2UhCj4gQ2hyaXN0aWFuIExpbmRpZyB3
cml0ZXMgKCJSZTogW1BBVENIIDEvMV0gdG9vbHMvb2NhbWw6IGNsZWFudXAgdG8gcmVkdWNlIGNv
bXBpbGVyIHdhcm5pbmdzIik6Cj4+IFBpbmcuIEFueSBjaGFuY2UgZ2V0dGluZyB0aGlzIGluLCBJ
YW4/Cj4gVGhhbmtzIGZvciB0aGUgcGluZy4KPgo+IEkgdHJpZWQgdG8gY29tbWl0IHRoaXMgcGF0
Y2ggYnV0Cj4KPiBtYXJpbmVyOnhlbi5naXQ+IGdpdC1hbSB+L05ld3MvdAo+IEFwcGx5aW5nOiB0
b29scy9vY2FtbDogY2xlYW51cCB0byByZWR1Y2UgY29tcGlsZXIgd2FybmluZ3MKPiBlcnJvcjog
cGF0Y2ggZmFpbGVkOiB0b29scy9vY2FtbC9saWJzL3hiL3hiLm1sOjY5Cj4gZXJyb3I6IHRvb2xz
L29jYW1sL2xpYnMveGIveGIubWw6IHBhdGNoIGRvZXMgbm90IGFwcGx5Cj4gZXJyb3I6IHBhdGNo
IGZhaWxlZDogdG9vbHMvb2NhbWwvdGVzdC9kbWVzZy5tbDoxCj4gZXJyb3I6IHRvb2xzL29jYW1s
L3Rlc3QvZG1lc2cubWw6IHBhdGNoIGRvZXMgbm90IGFwcGx5Cj4gLi4uCj4KPiBUaGF0J3Mgd2l0
aCBhIGNvcHkgb2YgdGhlIHBhdGNoIGZpc2hlZCBmcm9tIG15IHBlcnNvbmFsIGNvbG8gc2VydmVy
J3MKPiB2aWV3IG9mIHhlbi1kZXZlbC4KPgo+IEkgdGhpbmsgZWl0aGVyIHRoZSBtZXNzYWdlIG11
c3QgaGF2ZSBiZWVuIG1hbmdsZWQgYnkgQ2l0cml4J3MgbWFpbAo+IHN5c3RlbSBvbiB0aGUgd2F5
IG91dCBvZiBDaXRyaXgsIG9yIHRoZSBwYXRjaCBubyBsb25nZXIgYXBwbGllcy4KPgo+IENhbiB5
b3UgZG91YmxlIGNoZWNrIGFuZCBtYXliZSBwcm92aWRlIHRoZSBwYXRjaCBhcyBhbiBhdHRhY2ht
ZW50IG9yIGEKPiBnaXQgYnJhbmNoIG9yIHNvbWV0aGluZyA/CgpUaGF0J3MgYmVjYXVzZSBXZWkg
Y29tbWl0dGVkIGl0IDkgZGF5cyBhZ28uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
