From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86: split out cpuid objects and helpers
Date: Fri, 25 May 2018 11:01:18 +0100
Message-ID: <423ecd50-46ba-1e0e-be05-48942b5f7cfa@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-3-wei.liu2@citrix.com>
 <20180525094104.5ogk4qzcya5pfucc@MacBook-Pro-de-Roger.local>
 <20180525094912.zkwalyemsuutue2s@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j+m0=im=citrix.com=prvs=676bf93bc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fM9XH-0007HQ-8k
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 10:01:23 +0000
In-Reply-To: <20180525094912.zkwalyemsuutue2s@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, sergey.dyasli@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMTA6NDksIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBNYXkgMjUsIDIwMTgg
YXQgMTE6NDE6MDRBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gVGh1LCBN
YXkgMjQsIDIwMTggYXQgMDU6MDU6MTlQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPj4+IFRoZXkg
YXJlIG1vdmVkIHRvIGEgbmV3IGhlYWRlciB3aGljaCBpcyBnb2luZyB0byBiZSBjb25zdW1lZCBi
eSBib3RoCj4+PiB0aGUgaHlwZXJ2aXNvciBhbmQgdG9vbHN0YWNrLgo+Pj4KPj4+IENyZWF0ZSBh
IG5ldyBkaXJlY3RvcnkgZm9yIHRoaXMga2luZCBvZiBoZWFkZXJzIGluIGFudGljaXBhdGlvbiBv
Zgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBedGhhdD8KPj4+IG1vcmUgd2lsbCBjb21lLgo+Pj4KPj4+IE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Cj4+PiAtLS0KPj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4+Cj4+
PiBBbnkgc3VnZ2VzdGlvbiBvbiB0aGUgZGlyZWN0b3J5IG5hbWU/Cj4+PiAtLS0KPj4+ICB4ZW4v
aW5jbHVkZS9hc20teDg2L2FyY2gtc2hhcmVkL2NwdWlkLmggfCAyMTMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2NwdWlkLmggICAgICAg
ICAgICAgfCAyMTAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiBJIHdvdWxkIGhh
dmUgcGxhY2VkIHRob3NlIGluc2lkZSBvZjoKPj4KPj4geGVuL2luY2x1ZGUvcHVibGljL2FyY2gt
eDg2L2NwdWlkLmgKPj4KPj4gUHJvdGVjdGVkIHdpdGggYSAjaWYgZGVmaW5lZChfX1hFTl9fKSB8
fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pPwo+Pgo+IEkgZW52aXNpb24gdGhpcyBpcyBnb2luZyB0
byBncm93IGludG8gbGliY3B1aWQgb3Igc29tZXRoaW5nLCBqdXN0IGxpa2UKPiBsaWJlbGYuCgpJ
IHdhcyBhY3R1YWxseSBjb25zaWRlcmluZyBtYWtpbmcgYSBsaWJ4ODYgb3IgZXF1aXZhbGVudC7C
oCBBdCB0aGUKbWluaW11bSwgd2UnbGwgbmVlZCBhIHNpbWlsYXIgc3BsaXQgZm9yIHRoZSBNU1Ig
Y29kZS4KCkFsc28sIG1ha2luZyBzdHJ1Y3Qge2NwdWlkLG1zcn1fcG9saWN5IGF2YWlsYWJsZSB0
byB0aGUgZW11bGF0aW9uIGNvZGUKd2lsbCBkcm9wIHRoZSBjb2RlIHZvbHVtZSBtYXNzaXZlbHks
IGFuZCBoYXMgYmVlbiBvbiBteSBUT0RPIGxpc3QgZm9yIGFnZXMuCgo+IEFsc28gdGhpcyBpc24n
dCBzb21lIHNvcnQgb2YgaW50ZXJmYWNlIGJldHdlZW4gSFYgYW5kIHRvb2xzdGFjayAtLSB0aGUK
PiBpbnRlcmZhY2Ugd29ya3Mgb24gc2VyaWFsaXNlZCBkYXRhLiBQdXR0aW5nIHRoZSBpbnRlcm5h
bCByZXByZXNlbnRhdGlvbgo+IGluIHB1YmxpYyBoZWFkZXIgd291bGQgYmUgd3JvbmcuCgorMQoK
V2UgaGFwcGVuIHRvIHdhbnQgdG8gc2hhcmUgc29tZSBjb2RlIGJldHdlZW4gWGVuIGFuZCBsaWJ4
YywgYnV0IGl0CmRvZXNuJ3Qgd2FudCB0byBiZSBpbiBhbnkga2luZCBvZiBwdWJsaWMgaW50ZXJm
YWNlLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
