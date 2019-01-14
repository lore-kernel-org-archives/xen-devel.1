From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Mon, 14 Jan 2019 10:43:33 +0000
Message-ID: <8b3e217f-cc1a-cd72-d717-b708c603d95d@arm.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
 <e4a328c8-6f36-8ec4-a645-9f845b608fa4@oracle.com>
 <11c88af4-95db-86de-b073-534f5583c1e6@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0cWC=PW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1giziV-0000Uq-7L
 for xen-devel@lists.xenproject.org; Mon, 14 Jan 2019 10:43:39 +0000
In-Reply-To: <11c88af4-95db-86de-b073-534f5583c1e6@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel@lists.xenproject.org, tamas@tklengyel.com, sstabellini@kernel.org
Cc: kevin.tian@intel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, jbeulich@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, brian.woods@amd.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNC8wMS8yMDE5IDA5OjM0LCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4gT24gMS8x
Mi8xOSAxMjowNCBBTSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAxMi8xNC8xOCA2OjQ5
IEFNLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+PiBCbG9jayBpbnRlcnJ1cHRzIChpbiB2bXhf
aW50cl9hc3Npc3QoKSkgZm9yIHRoZSBkdXJhdGlvbiBvZgo+Pj4gcHJvY2Vzc2luZyBhIHN5bmMg
dm1fZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPj4+IGN1cnJlbnRseSB1c2VkIGZv
ciBzaW5nbGUtc3RlcHBpbmcpLiBPdGhlcndpc2UsIGF0dGVtcHRpbmcKPj4+IHRvIGVtdWxhdGUg
YW4gaW5zdHJ1Y3Rpb24gd2hlbiByZXF1ZXN0ZWQgYnkgYSB2bV9ldmVudAo+Pj4gcmVwbHkgbWF5
IGxlZ2l0aW1hdGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+Pj4gaHZtX2luamVjdF9wYWdlX2ZhdWx0
KCksIHdoaWNoIHRoZW4gb3ZlcndyaXRlcyB0aGUgYWN0aXZlCj4+PiBpbnRlcnJ1cHQgaW4gdGhl
IFZNQ1MuCj4+Pgo+Pj4gVGhlIHN5bmMgdm1fZXZlbnQgaGFuZGxpbmcgcGF0aCBvbiB4ODYvVk1Y
IGlzIChyb3VnaGx5KToKPj4+IG1vbml0b3JfdHJhcHMoKSAtPiBwcm9jZXNzIHZtX2V2ZW50IC0+
IHZteF9pbnRyX2Fzc2lzdCgpCj4+PiAocG9zc2libHkgd3JpdGluZyBWTV9FTlRSWV9JTlRSX0lO
Rk8pIC0+Cj4+PiBodm1fdm1fZXZlbnRfZG9fcmVzdW1lKCkgLT4gaHZtX2VtdWxhdGVfb25lX3Zt
X2V2ZW50KCkKPj4+IChwb3NzaWJseSBvdmVyd3JpdGluZyB0aGUgVk1fRU5UUllfSU5UUl9JTkZP
IHZhbHVlKS4KPj4+Cj4+PiBUaGlzIHBhdGNoIG1heSBhbHNvIGJlIGhlbHBmdWwgZm9yIHRoZSBm
dXR1cmUgcmVtb3ZhbAo+Pj4gb2YgbWF5X2RlZmVyIGluIGh2bV9zZXRfY3J7MCwzLDR9IGFuZCBo
dm1fc2V0X21zcigpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KPj4KPj4KPj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gCj4gVGhhbmtzISBTbyBub3cgd2Ug
aGF2ZSB0aHJlZSByZXZpZXdlZC1ieXMsIGlmIEknbSBub3QgbWlzdGFrZW4gYWxsIHdlIG5lZWQg
aXMgCj4gVGFtYXMnIChmb3IgdGhlIHZtX2V2ZW50IHBhcnQpIGFuZCBKdWxpZW4gLyBTdGVmYW5v
J3MgKGZvciBBUk0pIGFja3MgKG9yIAo+IG90aGVyd2lzZSkuCj4gCj4gQ291bGQgeW91IHBsZWFz
ZSB0YWtlIGEgbG9vaz8KCkFsbCB0aGUgQXJtIGNvZGUgbW9kaWZpZWQgZmFsbHMgdW5kZXIgIlZN
IEVWRU5ULCBNRU0gQUNDRVNTIGFuZCBNT05JVE9SIi4gU28gSSAKZG9uJ3QgdGhpbmsgeW91IG5l
ZWQgYW4gYWNrIGZyb20gU3RlZmFubyBvciBJLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
