From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: Ping: [PATCH] SVM: limit GIF=0 region
Date: Thu, 26 Jul 2018 18:35:58 -0400
Message-ID: <42cc764f-c651-7dc2-d8f2-eb340cb46e96@oracle.com>
References: <5B31EC1002000078001CDD44@prv1-mh.provo.novell.com>
 <5B59CDC802000078001D8341@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=73cs=kk=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fiorF-0007hg-1F
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 22:35:41 +0000
In-Reply-To: <5B59CDC802000078001D8341@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjYvMjAxOCAwOTozNCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMDYu
MTggYXQgMDk6MzIsICB3cm90ZToKPj4gVXNlIEVGTEFHUy5JRiBmb3IgYWxsIG9yZGluYXJ5IHB1
cnBvc2VzOyB0aGVyZSdzIGluIHBhcnRpY3VsYXIgbm8gbmVlZAo+PiB0byB1bmR1bHkgZGVmZXIg
Tk1JLyNNQy4gQ2xlYXIvc2V0IEdJRiBzb2xlbHkgYXJvdW5kIFZNUlVOIGl0c2VsZi4gVGhpcwo+
PiBoYXMgdGhlIGFkZGl0aW9uYWwgYWR2YW50YWdlIHRoYXQgc3ZtX3N0Z2lfbGFiZWwgbm93IGlu
ZGVlZCBtYXJrcyB0aGUKPj4gb25seSBwbGFjZSB3aGVyZSBHSUYgaXMgYmVpbmcgc2V0Lgo+Pgo+
PiBBIG5vdGUgcmVnYXJkaW5nIHRoZSBtYWluIFNUSSBwbGFjZW1lbnQ6IE9yaWduYWxseSBJIGhh
ZCBpdCBhdCB0aGUgcGxhY2UKPj4gdGhlIG1haW4gU1RHSSB3YXMgc2l0dGluZyBhdCBzbyBmYXIu
IEhvd2V2ZXIsIG15IEZhbTE1IGJveCByZWxpYWJseQo+PiBsb2NrcyB1cCBoYXJkIHdpdGggdGhp
cywgdW5sZXNzIEkgaGF2ZSB0aGUgTk1JIHdhdGNoZG9nIGVuYWJsZWQuIEkgY2FuCj4+IG9ubHkg
ZGVkdWNlIHRoYXQgdGhlIENQVSBkb2Vzbid0IGxpa2UgU1RHSSB3aXRoIEVGTEFHUy5JRiBjbGVh
ciBwbHVzCj4+IHNvbWUgb3RoZXIgY29uZGl0aW9uICh0aGUgbG9ja3VwIG9jY3VycyBvbmx5IGFm
dGVyIGV4aXRpbmcgdGhlIGJvb3QKPj4gbG9hZGVyIGluIHRoZSBndWVzdCkuIEFzIHRoZXJlJ3Mg
bm90aGluZyB3cm9uZyB3aXRoIGludGVycnVwdHMgYmVpbmcgb24KPj4gcmlnaHQgYWZ0ZXIgVk1S
VU4sIEkndmUgZGVjaWRlZCB0byBwdXQgdGhlIFNUSSByaWdodCBhZnRlciB0aGUgQ0xHSQo+PiAo
bWF0Y2hpbmcgd2hhdCBLVk0gZG9lcywgaS5lLiBoYXZpbmcgYSBmYWlyIGNoYW5jZSBvZiB3b3Jr
aW5nCj4+IGV2ZXJ5d2hlcmUpLgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KPiBQaW5nLCBmaXJzdCBhbmQgZm9yZW1vc3Qgb24gdGhlIGRlc2Ny
aWJlZCByYXRoZXIgdW5leHBlY3RlZCBiZWhhdmlvcj8KClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ry
b3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgoKYnV0IGZvciB0aGUgcXVlc3Rpb24g
SSB3aWxsIGhhdmUgdG8gZGVmZXIgdG8gQU1ELgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
