From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/timers: Fix memory leak with cpu
 unplug/plug
Date: Mon, 8 Apr 2019 12:38:02 +0100
Message-ID: <2801a3f5-5899-5730-4466-f4e32d111a8e@arm.com>
References: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
 <5394e8aa-bae4-8a27-327a-b0dcd0996477@arm.com>
 <ddb84ed5-b986-a9eb-be71-e3d0b5060cad@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ddb84ed5-b986-a9eb-be71-e3d0b5060cad@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzgvMTkgMTE6NDcgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDgvMDQv
MjAxOSAxMTozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gNC84LzE5IDEw
OjM5IEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gK8KgwqDCoCBjYXNlIENQVV9SRVNVTUVf
RkFJTEVEOgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICggIXBhcmtfb2ZmbGluZV9jcHVzICYmIHN5
c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfc3VzcGVuZCApCj4+Cj4+IFRoaXMgcGF0Y2ggYnJlYWtz
IGNvbXBpbGF0aW9uIG9uIGFybTMyL2FybTY0IGJlY2F1c2UgcGFya19vZmZsaW5lX2NwdXMKPj4g
aXMgbm90IGRlZmluZWQ6Cj4+Cj4+IHRpbWVyLmM6IEluIGZ1bmN0aW9uICdjcHVfY2FsbGJhY2sn
Ogo+PiB0aW1lci5jOjY1MToxNTogZXJyb3I6ICdwYXJrX29mZmxpbmVfY3B1cycgdW5kZWNsYXJl
ZCAoZmlyc3QgdXNlIGluCj4+IHRoaXMgZnVuY3Rpb24pCj4+ICDCoMKgwqDCoMKgwqDCoMKgIGlm
ICggIXBhcmtfb2ZmbGluZV9jcHVzICYmIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfc3VzcGVu
ZCApCj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+Cj4+
Cj4+IFdoYXQgaXMgdGhlIHB1cnBvc2Ugb2YgcGFya19vZmZsaW5lX2NwdXM/Cj4gCj4gU29ycnku
wqAgSSBzaG91bGQgaGF2ZSB3YWl0ZWQgZm9yIGEgZnVsbCBidWlsZCB0ZXN0IGZpcnN0Lgo+IAo+
IHBhcmtfb2ZmbGluZV9jcHVzIGlzIGEgd29ya2Fyb3VuZCBmb3IgSW50ZWwncyBNQ0UgYmVoYXZp
b3VyLCB3aGVyZSB0aGUKPiBzeXN0ZW0gd2lsbCBzaHV0IGRvd24gcmF0aGVyIHRoYW4gZGVsaXZl
ciBhbiAjTUMgaWYgbWFjaGluZSBjaGVja2luZwo+IGlzbid0IGNvbmZpZ3VyZWQgb24gYWxsIENQ
VXMuCj4gCj4gQXMgYSByZXN1bHQsIHdlIGhhdmUgdG8gc3RhcnQgYWxsIENQVXMsIGV2ZW4gYmV5
b25kIG1heGNwdXM9IGFuZCBzZXQgdXAKPiBtYWNoaW5lIGNoZWNrIGhhbmRsaW5nLCBhbmQgbmV2
ZXIgZXZlciBmcmVlIHRoZWlyIHN0YWNrcywgZXZlbiBpZiB3ZSdkCj4gcHJlZmVyIHRoZSBDUFVz
IHRvIGJlIG9mZmxpbmUuCgpJIGFtIGEgYml0IGNvbmZ1c2VkLCB3aHkgdGhpcyBpcyBuZWNlc3Nh
cnkgbm93IGZvciB0aGUgdGltZXIgYW5kIG5vdCBpbiAKb3RoZXIgcGxhY2VzIG9mIHRoZSBjb21t
b24gY29kZT8KCj4gCj4gQXJlIHlvdSBoYXBweSB3aXRoIGEKPiAKPiAjZGVmaW5lIHBhcmtfb2Zm
bGluZV9jcHVzIGZhbHNlID4KPiBpbiBBUk0/CgpUaGUgbmFtZSBpcyBmYWlybHkgY29uZnVzaW5n
IGlmIHlvdSBkb24ndCBrbm93IHRoZSBiYWNrZ3JvdW5kLgoKQnV0IEkgaGF2ZSB0byBhZG1pdCB0
aGF0IGV2ZW4gd2l0aCB5b3VyIGV4cGxhbmF0aW9uIGFib3ZlLCBJIHN0aWxsIGRvbid0IAp1bmRl
cnN0YW5kIHdoeSB5b3UgbmVlZCB0byBjaGVjayBwYXJrX29mZmxpbmVfY3B1cyBpbiB0aGUgdGlt
ZXJzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
