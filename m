From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: p2m: configure pa_range_info table
 to support 42 bit PA systems.
Date: Mon, 8 Apr 2019 13:07:45 +0100
Message-ID: <3c0153aa-0662-c51f-039c-2beb7eaaa34d@arm.com>
References: <20190315083439.23068-1-vishnu@os.amperecomputing.com>
 <68101da7-87b2-5514-26f6-a4e4d5f18be2@arm.com>
 <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDT42-0006Oh-8m
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 12:07:50 +0000
In-Reply-To: <21628b60-483a-69e5-cc5e-7c5ec98f93a7@os.amperecomputing.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Feng Kan OS <fengkan@os.amperecomputing.com>, Vishnu Pajjuri OS <vishnu@os.amperecomputing.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzLzE1LzE5IDExOjU3IFBNLCBGZW5nIEthbiBPUyB3cm90ZToKPiBUaGFua3MgSnVs
aWVuLgo+IAo+IE9uIDMvMTUvMTkgNDoyMSBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gVGhhbmsgeW91IGZvciBwb3N0aW5nIHRoZSBwYXRjaC4KPj4KPj4gVGl0bGU6IE5vIG5l
ZWQgZm9yIGZ1bGwgc3RvcCBpbiB0aGUgY29tbWl0IHRpdGxlLgo+Pgo+PiBPbiAxNS8wMy8yMDE5
IDA4OjM0LCBWaXNobnUgUGFqanVyaSBPUyB3cm90ZToKPj4gSSBjYW4ndCByZW1lbWJlciB3aGlj
aCBvdGhlciBwbGF0Zm9ybXMgc3VwcG9ydCA0Mi1iaXRzIFBBLiBJIHRoaW5rIGF0Cj4+IHRoYXQg
dGltZSBpdCB3YXMgWC1HZW5lLiBBcyBsb25nIGFzIG5vIGN1cnJlbnQgZW1iZWRkZWQgcGxhdGZv
cm0gd2UKPj4gc3VwcG9ydCB1c2UgNDItYml0IFBBLCB0aGlzIGNoYW5nZSBtYXkgYmUgb2suIFN0
ZWZhbm8gZG8geW91IHJlY2FsbCB3aGF0Cj4+IHdhcyB0aGUgcGxhdGZvcm0/Cj4gQW1wZXJlIGVN
QUcgcGxhdGZvcm0gaXMgZXNzZW50aWFsbHkgdGhlIGNvbnRpbnVhdGlvbiBvZiBYLUdlbmUuIFRo
ZXNlCj4gc3lzdGVtcyBhcmUgdGFyZ2V0ZWQgYXMgc2VydmVycyB3aXRoIHVwdG8gMVRCIG9mIFJB
TS4KPj4KPj4gSW4gYW55IGNhc2UsIHRoZSBuZXcgYmVoYXZpb3IgKGFuZCBjb25zZXF1ZW5jZSkg
bmVlZHMgdG8gYmUgY2xlYXJseQo+PiBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+
IEdvdCBpdCwgd2Ugd2lsbCByZXN1Ym1pdCBpZiBTdGVmYW5vIGlzIG9rYXkgd2l0aCB0aGUgY2hh
bmdlLgoKVG8gbWFrZSBwcm9ncmVzcyBvbiB0aGlzIHBhdGNoLCBJIHdvdWxkIHN1Z2dlc3QgdG8g
cmVzdWJtaXQgaXQgd2l0aCB0aGUgCmNoYW5nZXMgcmVxdWVzdGVkLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
