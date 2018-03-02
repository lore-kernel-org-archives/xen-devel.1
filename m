From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Setting up a Xen x86 community call
Date: Fri, 2 Mar 2018 17:00:10 +0000
Message-ID: <d38d3225-7c4a-590f-cb1e-2c684e6f53e7@citrix.com>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=prhv=fy=citrix.com=prvs=592350325=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ero2Y-0003Xn-6f
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:00:14 +0000
In-Reply-To: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, daniel.kiper@oracle.com, Susie Li <susie.li@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, Jan Beulich <jbeulich@suse.com>, "Hurwitz,
 Sherry" <sherry.hurwitz@amd.com>, Chao Peng <chao.p.peng@linux.intel.com>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDMvMTggMTU6MzksIExhcnMgS3VydGggd3JvdGU6Cj4gSGkgYWxsLCAKPiAoc29ycnkg
Zm9yIHRoZSBleHRlbnNpdmUgZGlzdHJpYnV0aW9uIGxpc3QgLSBJIHdlbnQgdGhyb3VnaCBNQUlO
VEFJTkVSUyBhbmQgcGVvcGxlIHdobyBtYXkgaGF2ZSBhbiBpbnRlcmVzdCkKPgo+IEkgd291bGQg
bGlrZSB0byBzdGFydCBvcmdhbml6aW5nIGEgcmVjdXJyaW5nIHg4NiBjb21tdW5pdHkgY2FsbCB0
byBkaXNjdXNzIGFuZCBzeW5jLXVwIG9uIHVwY29taW5nIGZlYXR1cmVzIGZvciBYZW4gb24geDg2
LiBUaGlzIGNhbGwgd291bGQgbWlycm9yIGFuZCBmb2xsb3cgYSBzaW1pbGFyIHN0cnVjdHVyZSB0
byB0aGUgQVJNIGNhbGwgKHNlZSBodHRwOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQveHFkeHZx
Y2pwZjJ5NWZ0dSBmb3IgdGhlIGxhc3Qgb25lKQo+Cj4gSSBleHBlY3QgdGhhdCB0aGUgY2FsbCB3
aWxsIGNvbnRhaW4KPgo+IGEpIENvb3JkaW5hdGlvbiBhbmQgUGxhbm5pbmcgCj4gQ29vcmRpbmF0
aW5nIHdobyBkb2VzIHdoYXQsIHdoYXQgbmVlZHMgYXR0ZW50aW9uLCB3aGF0IGlzIGJsb2NrZWQs
IGV0Yy4gCj4gSSB3b3VsZCBwcmVwYXJlIGEgbGlzdCBvZiBub24tbWVyZ2VkIHBhdGNoIHNlcmll
cyBvZiBhIGNlcnRhaW4gc2l6ZSAoZS5nLiBtb3JlIHRoYW4gNSBwYXRjaGVzKSBhbmQgYXR0YWNo
IHRvIHRoZSBpbnZpdGUKPiBJZiBhbnl0aGluZyBpcyBtaXNzZWQsIEkgd291bGQgZXhwZWN0IHRo
YXQgdGhlc2UgYXJlIHNlbnQgdG8gbWUgYmVmb3JlIHRoZSBtZWV0aW5nCj4KPiBiKSBEZXNpZ24g
YW5kIGFyY2hpdGVjdHVyZSByZWxhdGVkIGRpc2N1c3Npb25zOiBpbiBwYXJ0aWN1bGFyIGZvciBi
aWdnZXIsIG1vcmUgY29tcGxleCBpdGVtcywgLi4uIAo+IEFsdGhvdWdoIGFsbCBvZiB0aGlzIGNv
dWxkIGJlIGRvbmUgYnkgZW1haWwsIGluIHJlYWxpdHksIHdlIGFyZSBhbGwgaHVtYW4gYW5kIG1h
bnkgcGVvcGxlIGZpbmQgaXQgZWFzaWVyIHRvIGNvbGxhYm9yYXRlCj4gYW5kIGNvbW11bmljYXRl
IGJ5IHRhbGtpbmcgdG8gZWFjaCBvdGhlciwgcmF0aGVyIHRoYW4gYnkgZW1haWwuIFRoaXMgaXMg
bm90IGEgbXVzdCwgYnV0IGFuIG9wdGlvbiB0byBoaWdobGlnaHQgaXNzdWVzCj4KPiBjKSBEZW1v
cywgU2hhcmluZyBvZiBFeHBlcmllbmNlcywgU29tZXRpbWVzIGRpc2N1c3Npb24gb2Ygc3BlY2lm
aWMgaXNzdWVzL2J1Z3MvcHJvYmxlbXMvLi4uCj4gVGhpcyBpcyBzb21ldGhpbmcgd2hpY2ggaGFw
cGVucyBmcmVxdWVudGx5IG9uIHRoZSBBUk0gY2FsbCBhbmQgc2VlbXMgdG8gd29yayB2ZXJ5IHdl
bGwKPgo+IEkgd291bGQgc3VnZ2VzdCB0byBzdGFydCB3aXRoIGEgMSBob3VyIG1vbnRobHkgbWVl
dGluZzogcG9zc2libHkgZXZlcnkgMm5kIFR1ZSBvciBUaHUgZWFjaCBtb250aCAoZGVwZW5kcyBv
biB0aW1pbmcpLiBJIGtub3cgdGhhdCBwZW9wbGUgYXJlIHNwcmVhZCBhY3Jvc3MgZGlmZmVyZW50
IHRpbWV6b25lcyAoZnJvbSBDaGluYSB0byB0aGUgVVMpLCBzbyBJIHdvdWxkIGxpa2UgdG8gZ2F0
aGVyIHRob3VnaHRzIGJlZm9yZSBjaG9vc2luZyBhIHRpbWUuIFdlIG1heSBoYXZlIHRvIGhhdmUg
YWx0ZXJuYXRpbmcgdGltZS1zbG90cyBldmVyeSBvdGhlciBtb250aDogYnV0IHRoaXMgaXMgbm90
IGlkZWFsIGZvciBzb21lLgo+Cj4gVG8gZG8gdGhpcywgcGxlYXNlCj4gKiBSYWlzZSB5b3VyIGhh
bmRzIG9uIHdoZXRoZXIgeW91IG9yIHlvdXIgb3JnIHdvdWxkIHdhbnQgdG8gcGFydGljaXBhdGUK
Ci9tZSB3YXZlcwoKPiAqIFByb3ZpZGUgeW91ciB0aW1lem9uZQoKVVRDCgo+ICogUHJvdmlkZSBh
IFVUQyB0aW1lIHJhbmdlIHdoZW4geW91IGNhbiBhdHRlbmQgCgoxMGFtIC0gNXBtIGlkZWFsbHku
Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
