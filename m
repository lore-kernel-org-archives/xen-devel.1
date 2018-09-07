From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/6] xen/sched: Use %*pb[l] instead of
 cpumask_scn{, list}printf()
Date: Fri, 07 Sep 2018 02:03:51 -0600
Message-ID: <5B9230E702000078001E62FC@prv1-mh.provo.novell.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536235696-31359-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Dario Faggioli <dfaggioli@suse.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE0OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTIwNTksMTEgKzIwNTgsMTAgQEAgY3NjaGVkX2R1bXBfcGNwdShjb25zdCBzdHJ1
Y3Qgc2NoZWR1bGVyICpvcHMsIGludCBjcHUpCj4gICAgICBzcGMgPSBDU0NIRURfUENQVShjcHUp
Owo+ICAgICAgcnVucSA9ICZzcGMtPnJ1bnE7Cj4gIAo+IC0gICAgY3B1bWFza19zY25wcmludGYo
Y3B1c3RyLCBzaXplb2YoY3B1c3RyKSwgcGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpKTsK
PiAtICAgIHByaW50aygiQ1BVWyUwMmRdIG5yX3J1bj0lZCwgc29ydD0lZCwgc2libGluZz0lcywg
IiwKPiAtICAgICAgICAgICBjcHUsIHNwYy0+bnJfcnVubmFibGUsIHNwYy0+cnVucV9zb3J0X2xh
c3QsIGNwdXN0cik7Cj4gLSAgICBjcHVtYXNrX3NjbnByaW50ZihjcHVzdHIsIHNpemVvZihjcHVz
dHIpLCBwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpOwo+IC0gICAgcHJpbnRrKCJjb3JlPSVz
XG4iLCBjcHVzdHIpOwo+ICsgICAgcHJpbnRrKCJDUFVbJTAyZF0gbnJfcnVuPSVkLCBzb3J0PSVk
LCBzaWJsaW5nPSUqcGIsIGNvcmU9JSpwYlxuIiwKPiArICAgICAgICAgICBjcHUsIHNwYy0+bnJf
cnVubmFibGUsIHNwYy0+cnVucV9zb3J0X2xhc3QsCj4gKyAgICAgICAgICAgbnJfY3B1X2lkcywg
cGVyX2NwdShjcHVfc2libGluZ19tYXNrLCBjcHUpLAo+ICsgICAgICAgICAgIG5yX2NwdV9pZHMs
IHBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSk7CgpTdHJpY3RseSBzcGVha2luZyBoZXJlIGFu
ZCBlbHNld2hlcmUgeW91IHNob3VsZCB3cmFwIHRoZSBDUFUgbWFzawphY2Nlc3NlcyBpbiBjcHVt
YXNrX2JpdHMoKS4gVGhlbiBhZ2FpbiBJIHdvbmRlciB3aGV0aGVyIGEgc3BlY2lhbApjYXNlIGZv
ciBDUFUgbWFza3Mgd291bGRuJ3QgYmUgd2FycmFudGVkLCBtYWtpbmcgaXQgdW5uZWNlc3Nhcnkg
Zm9yCmNhbGxlcnMgdG8gcGFzcyBpbiBucl9jcHVfaWRzIGV4cGxpY2l0bHkuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
