From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Thu, 7 Feb 2019 09:08:54 +0000
Message-ID: <270f81f5-7a2e-eca6-8549-53b5098bde6f@arm.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
 <5C5945F70200007800213D6E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902050911350.22962@sstabellini-ThinkPad-X260>
 <CAF3u54BZKRcTWTJkKyUb+wZqTwAcAn=GWDDOHKu37BJyvWR6=g@mail.gmail.com>
 <alpine.DEB.2.10.1902051145190.22962@sstabellini-ThinkPad-X260>
 <58a03a79-3622-5e3c-42fe-87094a9a01c1@arm.com>
 <alpine.DEB.2.10.1902061123370.2723@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z5oE=QO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1grfg6-0004n0-FO
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 09:09:02 +0000
In-Reply-To: <alpine.DEB.2.10.1902061123370.2723@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDIvNi8xOSA3OjM1IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gV2VkLCA2IEZlYiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhvd2V2ZXIsIEkg
dGhpbmsgd2Ugc2hvdWxkIGFkZCBzb21lIHNhbml0eSBjaGVjayBpbiBhcmNoX3NldF9pbmZvX2d1
ZXN0IGZvcgo+PiBvdXIgcGVhY2Ugb2YgbWluZC4gRm9yIGd1ZXN0IGVudHJ5L2V4aXQsIHJhdGhl
ciB0aGFuIHplcm8gdGhlIHVwcGVyIDMyLWJpdHMgSQo+PiB3b3VsZCBhbHNvIGFkZCBzYW5pdHkg
Y2hlY2sgaW4gZW50ZXJfaHlwZXJ2aXNvcl9oZWFkIGFuZCBsZWF2ZV9oeXBlcnZpc29yX3RhaWwK
Pj4gYnV0IG9ubHkgaW4gZGVidWcgYnVpbGQuIEFueSBvcGluaW9ucz8KPiAKPiBEZWZpbml0ZWx5
IHdlIHNob3VsZCBoYXZlIHNhbml0eSBjaGVja3MuCgpJIHdpbGwgYWRkIHRoaXMgb25lIGFuZCAu
Li4KCj4+IEluIHRoZSBvZmZpY2lhbCBwdWJsaWMgaGVhZGVycywgSSBjYW4ndCBmaW5kIGFueXRo
aW5nIHRlbGxpbmcgeW91IHRoZSBzaXplIG9mCj4+IGVhY2ggYXJndW1lbnRzIGFuZCB0aGUgbnVt
YmVyIG9mIGFyZ3VtZW50cy4gSW5zdGVhZCB5b3UgaGF2ZSB0byBsb29rIGF0IFhlbgo+PiBjb2Rl
IHRvIGtub3cgdGhlIGV4YWN0IG51bWJlciBvZiBhcmd1bWVudHMgYW5kIHRoZSBzaXplLiBEaWQg
SSBtaXNzIGFueXRoaW5nPwo+IAo+IE5vLCBpdCBpcyBsaWtlIHlvdSB3cm90ZS4gSSB0aGluayBJ
IHNob3VsZCBoYXZlIHB1c2hlZCB0aGUgZGlzY3Vzc2lvbgo+IGZ1cnRoZXIgYW5kIGFkZGVkIG1v
cmUgaW5mb3JtYXRpb24gdG8gdGhlIFhlbiBwdWJsaWMgaGVhZGVycyBiYWNrIGluCj4gdGhvc2Ug
ZGF5cy4KCi4uLiBhbmQgdGhpcyBvbmUgaW4gbXkgbGlzdCBvZiB0aGluZ3MgdG8gaW1wcm92ZS4K
Cj4+PiBJbiBjb25jbHVzaW9uLCBpZiB5b3UgYW5kIG90aGVyIG1haW50YWluZXJzIHByZWZlciB1
bnNpZ25lZCBsb25nIEknbGwKPj4+IGRyb3AgbXkgcmVzZXJ2YXRpb24uCj4+Cj4+IFRoZSBzdW1t
YXJ5IG9mIG15IGUtbWFpbCBpczoKPj4gICAgICAtIHdlIG5lZWQgdG8gYWRkIHNhbml0eSBjaGVj
ayAob3IgemVybykgdXBwZXItYml0cyBmb3IgMzItYml0IGd1ZXN0Cj4+ICAgICAgLSB1bnNpZ25l
ZCBsb25nIHNob3VsZCBiZSBmaW5lIGZvciA2NC1iaXQgb25seSBmZWF0dXJlcwo+IAo+IEkgdGFr
ZSB0aGF0IHlvdSBtZWFuIHRoYXQgdW5zaWduZWQgbG9uZyBzaG91bGQgYmUgZmluZSwgYW5kIHdv
dWxkIGFsc28KPiBhbGxvdyB1cyB0byBpbnRyb2R1Y2UgNjQtYml0IG9ubHkgZmVhdHVyZXMgaW4g
dGhlIGZ1dHVyZSwgcmlnaHQ/IAoKdGhhdCdzIGNvcnJlY3QuCgpZb3UgYXJlCj4gKm5vdCogc2F5
aW5nIHRoYXQgdW5zaWduZWQgbG9uZyBzaG91bGQgb25seSBiZSB1c2VkIHdpdGggNjQtYml0Cj4g
Z3Vlc3RzL2h5cGVydmlzb3I/Cgp1bnNpZ25lZCBsb25nID09IHVpbnQzMl90IG9uIDMyLWJpdC4g
U28gaXQgd291bGQgYmUgc2lsbHkgb2YgbWUgdG8gCnN1Z2dlc3QgdGhhdCA6KS4KCj4gCj4+ICAg
ICAgLSB3ZSBuZWVkIHRvIGRvY3VtZW50IHRoZSBiZWhhdmlvciBvZiBlYWNoIGh5cGVyY2FsbCBh
bmQgcHJvdmlkZQo+PiBndWlkZWxpbmVzIGZvciBuZXcgb25lLgo+Pgo+PiBOb25lIG9mIHRoaXMg
aXMgc3BlY2lmaWMgdG8gQXJnbyBhbmQgSSB3b3VsZCBiZSBoYXBweSB0byBkZWZlciB0aGlzIGFz
IGEKPj4gZm9sbG93LXVwIHNlcmllcy4KPiAKPiBBc3N1bWluZyBteSB1bmRlcnN0YW5kaW5nIGlz
IHJpZ2h0LCBJIGFncmVlIHdpdGggeW91LgoKWW91IHVuZGVyc3Rvb2QgcmlnaHQuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
