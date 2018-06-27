From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/cpuid: Alter the policy logic for
 leaf 0xb to be multi-invocation
Date: Wed, 27 Jun 2018 17:01:31 +0100
Message-ID: <e42e0caa-cfac-a2ea-dc5e-e72974611804@citrix.com>
References: <1530107750-22040-1-git-send-email-andrew.cooper3@citrix.com>
 <1530107750-22040-3-git-send-email-andrew.cooper3@citrix.com>
 <5B33A61902000078001CE750@prv1-mh.provo.novell.com>
 <5936b8d9-033f-9568-db23-5f8b45b8d710@citrix.com>
 <20180627160003.kuvh5fgwnsnaqy3s@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180627160003.kuvh5fgwnsnaqy3s@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDYvMTggMTc6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjcsIDIwMTgg
YXQgMDQ6NTg6MDhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjcvMDYvMTgg
MTU6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjcuMDYuMTggYXQgMTU6NTUsIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+PiBAQCAtMzE2LDYgKzMxOSwzMyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX3Jhd19wb2xpY3kodm9pZCkKPj4+PiAgICAg
ICAgICAgICAgY3B1aWRfY291bnRfbGVhZig3LCBpLCAmcC0+ZmVhdC5yYXdbaV0pOwo+Pj4+ICAg
ICAgfQo+Pj4+ICAKPj4+PiArICAgIGlmICggcC0+YmFzaWMubWF4X2xlYWYgPj0gMHhiICkKPj4+
PiArICAgIHsKPj4+PiArICAgICAgICB1bmlvbiB7Cj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCBj
cHVpZF9sZWFmIGw7Cj4+Pj4gKyAgICAgICAgICAgIHN0cnVjdCBjcHVpZF90b3BvX2xlYWYgdDsK
Pj4+PiArICAgICAgICB9IHU7Cj4+Pj4gKwo+Pj4+ICsgICAgICAgIGZvciAoIGkgPSAwOyBpIDwg
QVJSQVlfU0laRShwLT50b3BvLnJhdyk7ICsraSApCj4+Pj4gKyAgICAgICAgewo+Pj4+ICsgICAg
ICAgICAgICBjcHVpZF9jb3VudF9sZWFmKDB4YiwgaSwgJnUubCk7Cj4+Pj4gKwo+Pj4+ICsgICAg
ICAgICAgICBpZiAoIHUudC50eXBlID09IDAgKQo+Pj4+ICsgICAgICAgICAgICAgICAgYnJlYWs7
Cj4+Pj4gKwo+Pj4+ICsgICAgICAgICAgICBwLT50b3BvLnN1YmxlYWZbaV0gPSB1LnQ7Cj4+Pj4g
KyAgICAgICAgfQo+Pj4+ICsKPj4+PiArICAgICAgICAvKgo+Pj4+ICsgICAgICAgICAqIFRoZSBj
aG9pY2Ugb2YgQ1BVSURfR1VFU1RfTlJfVE9QTyBpcyBwZXIgdGhlIG1hbnVhbC4gIEl0IG1heSBu
ZWVkCj4+Pj4gKyAgICAgICAgICogdG8gZ3JvdyBmb3IgZnV0dXJlIGhhcndhcmUuCj4+PiBNaXNz
aW5nIGQuCj4+IFdoZXJlP8KgIEknbSBhZnJhaWQgdGhhdCBhZnRlciByZXBlYXRlZCByZS1yZWFk
cywgSSBjYW4ndCBzcG90IGFueSBpc3N1ZS4KPj4KPiBoYXIgZCB3YXJlLiA7cAoKV293IEknbSBi
bGluZC7CoCBUaGFua3MuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
