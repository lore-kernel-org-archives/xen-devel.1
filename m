From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: x86 Community Call - Wed Aug 15,
 14:00 - 15:00 UTC - Minutes
Date: Tue, 21 Aug 2018 16:58:22 +0100
Message-ID: <1ed01d8f-1f1f-892a-8c47-5ce0cc519fc9@citrix.com>
References: <F842E0BA-CA4A-4438-B710-E857F47C5982@citrix.com>
 <B007EEBD3FB23C4B870B3DBAD89B9C78320E8B76@SHSMSX104.ccr.corp.intel.com>
 <5B7C34F902000078001E0934@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z42e=le=citrix.com=prvs=7644e2bb1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fs93A-0007tv-Dp
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 15:58:32 +0000
In-Reply-To: <5B7C34F902000078001E0934@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Yu C Zhang <yu.c.zhang@intel.com>
Cc: davorin.mista@aggios.com, Rich Persaud <persaur@gmail.com>, anastassios.nanos@onapp.com, Matt Spencer <Matt.Spencer@arm.com>, edgar.iglesias@xilinx.com, john.ji@intel.com, robin.randhawa@arm.com, Daniel Kiper <daniel.kiper@oracle.com>, mirela.simonovic@aggios.com, xen-devel <xen-devel@lists.xenproject.org>, Lars Kurth <lars.kurth@citrix.com>, Juergen Gross <jgross@suse.com>, tamas.k.lengyel@gmail.com, Christopher Clark <christopher.w.clark@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, committers@xenproject.org, vfachin@de.adit-jv.com, intel-xen@intel.com, Jarvis Roach <Jarvis.Roach@dornerworks.com>, Artem Mygaiev <artem_mygaiev@epam.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Brian Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>, JanakarajanNatarajan <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Stewart Hildebrand <Stewart.H>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDgvMjAxOCAxNjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjEuMDguMTgg
YXQgMTc6MjgsIDx5dS5jLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6Cj4+IFRoYW5rcyBMYXJzIGZv
ciB0aGUgc3VtbWFyeSwgYW5kIHNvcnJ5IGZvciB0aGUgbGF0ZSB1cGRhdGUuCj4+Cj4+IE15IHF1
ZXN0aW9uIGlzIGFib3V0IHRoZSBjcHVpZCBwb2xpY3kgZm9yIE1BWFBIWVNBRERSIGluIFhlbi4g
Cj4+Cj4+IEl0IHNlZW1zIFhlbiBpcyBleHBvc2luZyB0aGUgaG9zdCBNQVhQSFlTQUREUiB2YWx1
ZSB0byBIVk0gYXMgdGhlIGRlZmF1bHQgCj4+IGNob2ljZS4gQW5kIEkgYW0gd29uZGVyaW5nLCB3
aGF0IGlmIGEgVk0gaXMgY3JlYXRlZCBvbiBhIGhhcmR3YXJlIHBsYXRmb3JtIAo+PiB3aXRoIGFk
ZHJlc3Mgd2lkdGggQSwgYW5kIGxhdGVyIG1pZ3JhdGVkIHRvIGFub3RoZXIgcGxhdGZvcm0gd2l0
aCBhZGRyZXNzIAo+PiB3aWR0aCBCPyBTaG91bGQgdGhpcyBiZSBhbGxvd2VkIGluIFhlbj8gIAo+
IEFuZHJldydzIGZ1cnRoZXIgbGV2ZWxpbmcgd29yayBpcywgYWZhaXUsIGdvaW5nIHRvIGluY2x1
ZGUgbGV2ZWxpbmcgb2YKPiB0aGF0IGZpZWxkIGFzIHdlbGwuCgpJIGNlcnRhaW5seSBwbGFubmVk
IHRvLCBidXQgYXMgaXQgdHVybnMgb3V0LCB0aGF0IGl0IGlzIHJhdGhlciBtb3JlCmNvbXBsaWNh
dGVkIHRoYW4gSSdkIGhvcGVkLgoKVGhlcmUgaXMgYSBjb3JuZXIgY2FzZSB3aGVyZSwgaWYgbWF4
cGh5YWRkciBpcyBsZXZlbGxlZCBsb3dlciB0aGFuIHRoZQpjdXJyZW50IGhhcmR3YXJlLCBhbmQg
dGhlIGd1ZXN0IGlzIHJlbHlpbmcgb24gI1BGW1JTVkRdIHRyaWNrcywgaWYgdGhlCm9ubHkgcmVz
ZXJ2ZWQgYml0KHMpIHRoZXkgc2V0IHdlcmUgaW4gdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUg
cmVhbAphbmQgdmlydHVhbGlzZWQgbWF4cGh5YWRkciwgYW5kIHRoZSBwYWdld2FsayB0YWtlcyBh
biBhY2Nlc3MgdmlvbGF0aW9uCnJhdGhlciB0aGFuIGEgdGVybWluYWwgZmF1bHQsIFhlbiBoYXMg
bm8gd2F5IG9mIGZha2luZyB1cCB0aGUgUlNWRApwcm9wZXJ0eSBiZWNhdXNlIHRoZSBhY2Nlc3Mg
d29uJ3QgZWxpY2l0IGFuIEVQVC1iYXNlZCBWTUV4aXQuCgpHaXZlbiB0aGF0IG1pZ3JhdGlvbiBo
YXMgYmVlbiB3b3JraW5nIHdlbGwgZW5vdWdoIHRodXMgZmFyICh3aXRoIHRoZQpDUFVJRCB2aWV3
IG9mIG1heHBoeWFkZHIgY2hhbmdpbmcgdW5kZXIgdGhlIGd1ZXN0cyBmZWV0KSwgdGhpcyBtYXkg
YmUgb2YKbGl0dGxlIGNvbmNlcm4sIGJ1dCBpdCBzdGlsbCBoYXMgbWUgc29tZXdoYXQgd29ycmll
ZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
