From: Juergen Gross <jgross@suse.com>
Subject: Re: per-domain configuration and inappropriate use of
 globals
Date: Fri, 19 Oct 2018 20:22:16 +0200
Message-ID: <269da316-bade-8b4c-b243-e7828f872a79@suse.com>
References: <144647a7-a35c-c915-a1f3-6627bcd68f10@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <144647a7-a35c-c915-a1f3-6627bcd68f10@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTAvMjAxOCAxODo1NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJbiBwcmFjdGljZSwg
aGF2aW5nIGZpbmUgZ3JhaW4gY29udHJvbCBvZiBhbGwgdGhlIGZlYXR1cmVzIGxpa2Ugd291bGQg
YmUKPiBleGNlbGxlbnQgZm9yIHRlc3RpbmcgcHVycG9zZXMsIGJlY2F1c2UgaXQgYWxsb3dzIHlv
dSB0byBib290IHR3bwo+IG90aGVyd2lzZS1pZGVudGljYWwgVk1zIHdpdGggb25lIGNvbmZpZ3Vy
YXRpb24gZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZW0uCj4gCj4gSW4gdGhlIHNwaXJpdCBvZiB0aGUg
YWxyZWFkeSBpbiBwcm9ncmVzcyBkb21haW5jcmVhdGUgd29yaywgb3B0aW9ucyBsaWtlCj4gdGhl
c2Ugc2hvdWxkIGJlIHNlbGVjdGFibGUgYXQgZG9tYWluIGNyZWF0aW9uIHRpbWUsIGFuZCBpbW11
dGFibGUKPiB0aGVyZWFmdGVyLgo+IAo+IFRoYXQgc2FpZCwgdGhlcmUgaXMgYSBwbGV0aG9yYSBv
ZiB0d2Vha2FibGVzLCBhbmQgSSdtIG5vdCBzdXJlIGhvdyBiZXN0Cj4gdG8gZXhwb3NlIHRoZW0u
wqAgV2hpbGUgbW9zdCAoYWxsPykgb2YgdGhlc2Ugb3B0aW9ucyBhcmUgaW5oZXJlbnRseQo+IHN1
cHBvcnRlZCAoYXMgcGxheWluZyB3aXRoIHRoZW0gc2ltdWxhdGVzIHdoYXQgWGVuIHdvdWxkIGNo
b3NlIG9uCj4gZGlmZmVyZW50IGhhcmR3YXJlKSwgSSBleHBlY3QgdGhlcmUgd2lsbCBiZSBhbXBs
ZSBvcHBvcnR1bml0eSBmb3IgcGVvcGxlCj4gdG8gYnJlYWsgdGhlaXIgc3lzdGVtcyBpZiB0aGV5
IHR3ZWFrIHRvbyBtdWNoLgo+IAo+IElzIHRoZXJlIGxpYWJsZSB0byBiZSBhbnkgcHJvdmlzaW9u
IGluIHhsL2xpYnhsIHRvIGhhdmUgInVuc3RhYmxlIgo+IGNvbmZpZ3VyYXRpb24sIHdoaWNoIGlz
IGVhc2lseSBpZGVudGlmaWVkIGFzICJtYXkgc3RvcCB3b3JraW5nIC8gY2Vhc2UKPiB0byBleGlz
dCAvIGJlY29tZSBpbnZhbGlkIGF0IGFueSBwb2ludCBpbiB0aGUgZnV0dXJlPyIKPiAKPiBBbHRl
cm5hdGl2ZWx5LCBhcmUgdGhlcmUgYW55IG90aGVyIHN1Z2dlc3Rpb25zIGZvciBhbHRlcm5hdGl2
ZSBtZWNoYW5pc21zPwoKUGVyLWRvbWFpbiBwYXJhbWV0ZXJzIGxpa2UgaW4gbXkgc2VyaWVzPyBZ
b3UgY291bGQgZ3VhcmQgdGhlICJkYW5nZXJvdXMiCm9uZXMgYnkgYSBnbG9iYWwgcGFyYW1ldGVy
IChib290LXRpbWUgb3IgcnVuLXRpbWUgc2V0dGFibGUpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
