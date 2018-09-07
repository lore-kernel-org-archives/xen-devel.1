From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/6] xen/sched: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Fri, 7 Sep 2018 14:56:07 +0100
Message-ID: <72e89500-dcfc-7d61-cc2f-c5b9401ebfe5@citrix.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
 <5B9230E702000078001E62FC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B9230E702000078001E62FC@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMDk6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA5LjE4IGF0
IDE0OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IEBAIC0yMDU5LDEx
ICsyMDU4LDEwIEBAIGNzY2hlZF9kdW1wX3BjcHUoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3Bz
LCBpbnQgY3B1KQo+PiAgICAgIHNwYyA9IENTQ0hFRF9QQ1BVKGNwdSk7Cj4+ICAgICAgcnVucSA9
ICZzcGMtPnJ1bnE7Cj4+ICAKPj4gLSAgICBjcHVtYXNrX3NjbnByaW50ZihjcHVzdHIsIHNpemVv
ZihjcHVzdHIpLCBwZXJfY3B1KGNwdV9zaWJsaW5nX21hc2ssIGNwdSkpOwo+PiAtICAgIHByaW50
aygiQ1BVWyUwMmRdIG5yX3J1bj0lZCwgc29ydD0lZCwgc2libGluZz0lcywgIiwKPj4gLSAgICAg
ICAgICAgY3B1LCBzcGMtPm5yX3J1bm5hYmxlLCBzcGMtPnJ1bnFfc29ydF9sYXN0LCBjcHVzdHIp
Owo+PiAtICAgIGNwdW1hc2tfc2NucHJpbnRmKGNwdXN0ciwgc2l6ZW9mKGNwdXN0ciksIHBlcl9j
cHUoY3B1X2NvcmVfbWFzaywgY3B1KSk7Cj4+IC0gICAgcHJpbnRrKCJjb3JlPSVzXG4iLCBjcHVz
dHIpOwo+PiArICAgIHByaW50aygiQ1BVWyUwMmRdIG5yX3J1bj0lZCwgc29ydD0lZCwgc2libGlu
Zz0lKnBiLCBjb3JlPSUqcGJcbiIsCj4+ICsgICAgICAgICAgIGNwdSwgc3BjLT5ucl9ydW5uYWJs
ZSwgc3BjLT5ydW5xX3NvcnRfbGFzdCwKPj4gKyAgICAgICAgICAgbnJfY3B1X2lkcywgcGVyX2Nw
dShjcHVfc2libGluZ19tYXNrLCBjcHUpLAo+PiArICAgICAgICAgICBucl9jcHVfaWRzLCBwZXJf
Y3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpOwo+IFN0cmljdGx5IHNwZWFraW5nIGhlcmUgYW5kIGVs
c2V3aGVyZSB5b3Ugc2hvdWxkIHdyYXAgdGhlIENQVSBtYXNrCj4gYWNjZXNzZXMgaW4gY3B1bWFz
a19iaXRzKCkuCgpXaHk/IEl0cyBiYXJlbHkgdXNlZCwgYW5kIGlzIGFub3RoZXIgZXhhbXBsZSBv
ZiBhIGhlbHBlciB3aGljaCBvbmx5IGFkZHMKdG8gY29kZSB2b2x1bWUuCgo+IFRoZW4gYWdhaW4g
SSB3b25kZXIgd2hldGhlciBhIHNwZWNpYWwKPiBjYXNlIGZvciBDUFUgbWFza3Mgd291bGRuJ3Qg
YmUgd2FycmFudGVkLCBtYWtpbmcgaXQgdW5uZWNlc3NhcnkgZm9yCj4gY2FsbGVycyB0byBwYXNz
IGluIG5yX2NwdV9pZHMgZXhwbGljaXRseS4KClRoZSBvbmx5IHdheSBvZiBzcGVjaWFsIGNhc2lu
ZyBpcyB0byBoYXZlIGEgZGlmZmVyZW50IGN1c3RvbSAlcApmb3JtYXR0ZXIuwqAgQWxsIHByaW50
aW5nIG9mIGNwdSBhbmQgbm9kZW1hc2tzIGFyZSBpbiBrZXloYW5kbGVycyBzbyBJCmRvbid0IHRo
aW5rIGEgY3VzdG9tIGNhc2UgaXMgZ29pbmcgdG8gYmUgd29ydGggaXQuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
