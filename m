From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: Setting up a Xen x86 community call
Date: Fri, 2 Mar 2018 17:22:19 +0000
Message-ID: <2b0852fa-5ff6-42ca-316e-052f41a803c6@citrix.com>
References: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=8jhl=fy=citrix.com=prvs=59217d4f4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1eroO6-0006Dn-32
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:22:30 +0000
In-Reply-To: <B2025C1A-199C-4019-9ECF-AFF34FE8D702@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, daniel.kiper@oracle.com, Susie Li <susie.li@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <royger@freebsd.org>, John Ji <john.ji@intel.com>, Babu Moger <Babu.Moger@amd.com>, Rich Persaud <persaur@gmail.com>, paul.durrant@citrix.com, committers@xenproject.org, Jan Beulich <jbeulich@suse.com>, "Hurwitz,
 Sherry" <sherry.hurwitz@amd.com>, Chao Peng <chao.p.peng@linux.intel.com>, joao.m.martins@oracle.com, Brian Woods <brian.woods@amd.com>, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDIvMjAxOCAwMzozOSBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPiBIaSBhbGwsIAo+IChz
b3JyeSBmb3IgdGhlIGV4dGVuc2l2ZSBkaXN0cmlidXRpb24gbGlzdCAtIEkgd2VudCB0aHJvdWdo
IE1BSU5UQUlORVJTIGFuZCBwZW9wbGUgd2hvIG1heSBoYXZlIGFuIGludGVyZXN0KQo+IAo+IEkg
d291bGQgbGlrZSB0byBzdGFydCBvcmdhbml6aW5nIGEgcmVjdXJyaW5nIHg4NiBjb21tdW5pdHkg
Y2FsbCB0byBkaXNjdXNzIGFuZCBzeW5jLXVwIG9uIHVwY29taW5nIGZlYXR1cmVzIGZvciBYZW4g
b24geDg2LiBUaGlzIGNhbGwgd291bGQgbWlycm9yIGFuZCBmb2xsb3cgYSBzaW1pbGFyIHN0cnVj
dHVyZSB0byB0aGUgQVJNIGNhbGwgKHNlZSBodHRwOi8veGVuLm1hcmttYWlsLm9yZy90aHJlYWQv
eHFkeHZxY2pwZjJ5NWZ0dSBmb3IgdGhlIGxhc3Qgb25lKQo+IAo+IEkgZXhwZWN0IHRoYXQgdGhl
IGNhbGwgd2lsbCBjb250YWluCj4gCj4gYSkgQ29vcmRpbmF0aW9uIGFuZCBQbGFubmluZyAKPiBD
b29yZGluYXRpbmcgd2hvIGRvZXMgd2hhdCwgd2hhdCBuZWVkcyBhdHRlbnRpb24sIHdoYXQgaXMg
YmxvY2tlZCwgZXRjLiAKPiBJIHdvdWxkIHByZXBhcmUgYSBsaXN0IG9mIG5vbi1tZXJnZWQgcGF0
Y2ggc2VyaWVzIG9mIGEgY2VydGFpbiBzaXplIChlLmcuIG1vcmUgdGhhbiA1IHBhdGNoZXMpIGFu
ZCBhdHRhY2ggdG8gdGhlIGludml0ZQo+IElmIGFueXRoaW5nIGlzIG1pc3NlZCwgSSB3b3VsZCBl
eHBlY3QgdGhhdCB0aGVzZSBhcmUgc2VudCB0byBtZSBiZWZvcmUgdGhlIG1lZXRpbmcKPiAKPiBi
KSBEZXNpZ24gYW5kIGFyY2hpdGVjdHVyZSByZWxhdGVkIGRpc2N1c3Npb25zOiBpbiBwYXJ0aWN1
bGFyIGZvciBiaWdnZXIsIG1vcmUgY29tcGxleCBpdGVtcywgLi4uIAo+IEFsdGhvdWdoIGFsbCBv
ZiB0aGlzIGNvdWxkIGJlIGRvbmUgYnkgZW1haWwsIGluIHJlYWxpdHksIHdlIGFyZSBhbGwgaHVt
YW4gYW5kIG1hbnkgcGVvcGxlIGZpbmQgaXQgZWFzaWVyIHRvIGNvbGxhYm9yYXRlCj4gYW5kIGNv
bW11bmljYXRlIGJ5IHRhbGtpbmcgdG8gZWFjaCBvdGhlciwgcmF0aGVyIHRoYW4gYnkgZW1haWwu
IFRoaXMgaXMgbm90IGEgbXVzdCwgYnV0IGFuIG9wdGlvbiB0byBoaWdobGlnaHQgaXNzdWVzCj4g
Cj4gYykgRGVtb3MsIFNoYXJpbmcgb2YgRXhwZXJpZW5jZXMsIFNvbWV0aW1lcyBkaXNjdXNzaW9u
IG9mIHNwZWNpZmljIGlzc3Vlcy9idWdzL3Byb2JsZW1zLy4uLgo+IFRoaXMgaXMgc29tZXRoaW5n
IHdoaWNoIGhhcHBlbnMgZnJlcXVlbnRseSBvbiB0aGUgQVJNIGNhbGwgYW5kIHNlZW1zIHRvIHdv
cmsgdmVyeSB3ZWxsCj4gCj4gSSB3b3VsZCBzdWdnZXN0IHRvIHN0YXJ0IHdpdGggYSAxIGhvdXIg
bW9udGhseSBtZWV0aW5nOiBwb3NzaWJseSBldmVyeSAybmQgVHVlIG9yIFRodSBlYWNoIG1vbnRo
IChkZXBlbmRzIG9uIHRpbWluZykuIEkga25vdyB0aGF0IHBlb3BsZSBhcmUgc3ByZWFkIGFjcm9z
cyBkaWZmZXJlbnQgdGltZXpvbmVzIChmcm9tIENoaW5hIHRvIHRoZSBVUyksIHNvIEkgd291bGQg
bGlrZSB0byBnYXRoZXIgdGhvdWdodHMgYmVmb3JlIGNob29zaW5nIGEgdGltZS4gV2UgbWF5IGhh
dmUgdG8gaGF2ZSBhbHRlcm5hdGluZyB0aW1lLXNsb3RzIGV2ZXJ5IG90aGVyIG1vbnRoOiBidXQg
dGhpcyBpcyBub3QgaWRlYWwgZm9yIHNvbWUuCj4gCj4gVG8gZG8gdGhpcywgcGxlYXNlCj4gKiBS
YWlzZSB5b3VyIGhhbmRzIG9uIHdoZXRoZXIgeW91IG9yIHlvdXIgb3JnIHdvdWxkIHdhbnQgdG8g
cGFydGljaXBhdGUKCm8vCgo+ICogUHJvdmlkZSB5b3VyIHRpbWV6b25lCgpVVEMKCj4gKiBQcm92
aWRlIGEgVVRDIHRpbWUgcmFuZ2Ugd2hlbiB5b3UgY2FuIGF0dGVuZCAKClVUQyAwOTAwLTE4MDAK
CiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
