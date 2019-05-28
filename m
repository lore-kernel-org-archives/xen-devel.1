From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
Date: Tue, 28 May 2019 10:23:46 +0100
Message-ID: <bb5aa1e6-f927-5f96-dbd7-1582da1733f3@arm.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
 <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExCW=T4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVYKl-0006r0-3p
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 09:23:51 +0000
In-Reply-To: <d94e7186-5f5d-1d93-4462-af18ba7da018@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC8wNS8yMDE5IDEwOjE3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyOC4wNS4xOSAxMTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJIGFtIG5v
dCBhbnN3ZXJpbmcgb24gdGhlIGNvbnRlbnQgeWV0LCBJIHdpbGwgZG8gdGhhdCBzZXBhcmF0ZWx5
LiBUaGUgCj4+IHRocmVhZGluZyBmb3IgdGhpcyBzZXJpZXMgbG9va3MgcXVpdGUgY29uZnVzaW5n
LiBUaGUgaGVhZCBvZiB0aGUgdGhyZWFkIGlzIAo+PiB0aGlzIHBhdGNoIChpLmUgUkZDIDIpIGJ1
dCB0aGVuIHlvdSBoYXZlIGEgY292ZXIgbGV0dGVyIHdpdGhpbiB0aGUgdGhyZWFkIAo+PiB0YWdn
ZWQgIlYzIi4KPiAKPiBBY3R1YWxseSBJJ3ZlIG5vdGljZWQgdGhlIG1hbmdsZWQgdGhyZWFkaW5n
LiBCdXQgbm90IHN1cmUgd2h5IGl0IGlzIHNvLiBJIGp1c3QgCj4gcGFzc2VkIGEgZm9sZGVyIHdp
dGggdGhvc2UgcGF0Y2hlcyB0byBnaXQtc2VuZC1tYWlsLgoKSUlSQywgZ2l0LXNlbmQtZW1haWwg
d2lsbCB1c2UgdGhlIGZpcnN0IGUtbWFpbCBpbiB0aGUgYWxwaGFiZXRpY2FsIG9yZGVyIGFzIHRo
ZSAKInRvcCBlLW1haWwiIGFuZCBhbGwgdGhlIG90aGVyIHdpbGwgYmUgc2VuZCAiSW4tUmVwbHkt
VG8iLgoKPiAKPj4gwqBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBlLW1haWxzIHRhZ2dl
ZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIAo+PiB3aGVyZSBhcyBSRkMgMiBhbmQgUkZD
IDMgYXJlIHZhcmlhbnRzLiBBbSBJIGNvcnJlY3Q/Cj4gCj4gWWVzLCBzdXJlLgo+IAo+PiBJZiBz
bywgZm9yIG5leHQgdGltZSwgSSB3b3VsZCByZWNvbW1lbmQgdG8gaGF2ZSB0aGUgY292ZXIgbGV0
dGVyIGZpcnN0IGFuZCAKPj4gdGhlbiBhbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8i
IHRoZSBjb3ZlciBsZXR0ZXIuIFRoaXMgbWFrZXMgZWFzaWVyIHRvIAo+PiB0cmFjayBzZXJpZXMu
Cj4gCj4gSXQgbWlnaHQgaGVscC4gQnV0IGJlZm9yZSBpdCB3b3JrZWQgd2VsbCB3aXRob3V0IGFk
ZGl0aW9uYWwgdHJpY2tzLgoKSW4gZ2VuZXJhbCwgYWxsIHRoZSBwYXRjaCBzZW50IGFyZSBzdGFy
dGluZyB3aXRoIGEgbnVtYmVyIGZvbGxvd2VkIGJ5IHRoZSB0aXRsZS4gClRoZSBudW1iZXIgZW5z
dXJlIHRoZSBjb3JyZWN0IG9yZGVyaW5nLiBJZiB5b3UgZG9uJ3QgaGF2ZSBudW1iZXIgdGhlbiwg
eW91IHdpbGwgCmZhbGxiYWNrIHRvIGFscGhhYmV0aWNhbCBvcmRlci4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
