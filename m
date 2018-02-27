From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: use hvc console for dom0
Date: Tue, 27 Feb 2018 20:09:05 +0000
Message-ID: <19afb9f9-a845-e627-8f78-d1fdb349c6bd__11542.8719240755$1519762088$gmane$org@arm.com>
References: <20180226110822.13787-1-jgross@suse.com>
 <0d8bdda5-faef-41da-344a-644b5c3d6006@epam.com>
 <58e94cc9-9b09-d6b7-3122-fb4c83e97926@suse.com>
 <b57092b4-e740-e1f8-3885-a817bb7d4e70@arm.com>
 <alpine.DEB.2.10.1802271159070.4239@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=r2zm=fv=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqlYs-0004IK-6m
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 20:09:18 +0000
In-Reply-To: <alpine.DEB.2.10.1802271159070.4239@sstabellini-ThinkPad-X260>
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
Cc: Juergen Gross <jgross@suse.com>, Andrii Anisov <andrii_anisov@epam.com>, linux-kernel@vger.kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNy8wMi8yMDE4IDIwOjAzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAyNyBGZWIgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjYv
MDIvMTggMTI6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+PiBPbiAyNi8wMi8xOCAxMzowNiwg
QW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+PiBIZWxsbyBKdWVyZ2VuLAo+Pj4+Cj4+Pj4KPj4+PiBP
biAyNi4wMi4xOCAxMzowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gVG9kYXkgdGhlIGh2
YyBjb25zb2xlIGlzIGFkZGVkIGFzIGEgcHJlZmVycmVkIGNvbnNvbGUgZm9yIHB2IGRvbVVzCj4+
Pj4+IG9ubHkuIEFzIHRoaXMgcmVxdWlyZXMgYSBib290IHBhcmFtZXRlciBmb3IgZ2V0dGluZyBk
b20wIG1lc3NhZ2VzIHBlcgo+Pj4+PiBkZWZhdWx0IGFkZCBpdCBmb3IgZG9tMCwgdG9vLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+
Pj4+IC0tLQo+Pj4+PiAgIMKgIGFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyB8IDQgKysrLQo+
Pj4+PiAgIMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2Fy
Y2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+Pj4+IElzIHRoaXMgc29tZXRoaW5nIHg4NiBzcGVj
aWZpYz8gQ291bGQgaXQgYmUgYSBnZW5lcmljIGFwcHJvYWNoPwo+Pj4KPj4+IEluIGNhc2UgQVJN
IHdhbnRzIHNvbWV0aGluZyBzaW1pbGFyIEkgZ3Vlc3MgdGhlIHRlc3QgZm9yCj4+PiB4ZW5faW5p
dGlhbF9kb21haW4oKSBzaG91bGQgYmUgZHJvcHBlZCBpbiB4ZW5fZWFybHlfaW5pdCgpLgo+PiBJ
IGFtIHByZXR0eSBzdXJlIHdlIGRpc2N1c3NlZCB0byByZW1vdmUgIXhlbl9pbml0aWFsX2RvbWFp
bigpIGZvciBBcm0gaW4gdGhlCj4+IHBhc3QuIEJ1dCBJIGRvbid0IHJlbWVtYmVyIHdoeSB0aGUg
cGF0Y2ggd2FzIG5vdCBzZW50IHRvIHJlbW92ZSBpdC4KPj4KPj4gQW55d2F5LCBJIGd1ZXNzIHRo
aXMgc2hvdWxkIGJlIGZpbmUgdG8gaGF2ZSBodmMgYXMgYSBwcmVmZXJyZWQgY29uc29sZSBmb3Ig
dGhlCj4+IGluaXRpYWwgZG9tYWluIGFzIHdlbGwuCj4gCj4gVXN1YWxseSwgRG9tMCBoYXMgYWNj
ZXNzIHRvIHNldmVyYWwgcGh5c2ljYWwgVUFSVHMgYW5kL29yIFZHQSwgbWFraW5nCj4gdGhpcyBw
YXRjaCBsZXNzIG9idmlvdXNseSBkZXNpcmFibGUuIEkgdGhpbmsgdGhhdCBmb3IgRG9tMCB0aGUg
YmVzdAo+IGJlaGF2aW9yIHdvdWxkIGJlIHRvIGFkZCAiaHZjMCIgYXMgZmlyc3QgY29uc29sZSBy
YXRoZXIgdGhhbiBsYXN0Cj4gY29uc29sZSwgc28gdGhhdCBpZiB0aGUgdXNlciBzcGVjaWZpZWQg
c29tZXRoaW5nIGVsc2UsIHRoaXMgY2FsbCB3b24ndAo+IGludGVyZmVyZSB3aXRoIGl0LgoKV2Vs
bCwgdGhhdCdzIGV4YWN0bHkgdGhlIGdvYWwgb2YgYWRkX3ByZWZlcnJlZF9jb25zb2xlLiBJdCB3
aWxsIHVzZSBodmMwIAp1bmxlc3Mgc3BlY2lmaWVkIG90aGVyd2lzZSBieSB0aGUgdXNlciBvbiB0
aGUgY29tbWFuZCBsaW5lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
