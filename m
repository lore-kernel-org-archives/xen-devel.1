From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] x86/acpi: add retrieval function for
	rsdp address
Date: Sun, 28 Jan 2018 17:04:53 +0200
Message-ID: <CAHp75VdUO2Rq7geYD9xxY3nnzGAhO46+w+rQx44=MgJ6obRcEA__18362.2654098601$1517151862$gmane$org@mail.gmail.com>
References: <20180125143639.9969-1-jgross@suse.com>
 <20180125143639.9969-2-jgross@suse.com>
 <CAHp75VdgdQXH-d9+Fo1DwGdfV1pB0jADMmwAK1BU7oN6dgQs8Q@mail.gmail.com>
 <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=36+n=ex=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1efoVr-0000UN-Oc
 for xen-devel@lists.xenproject.org; Sun, 28 Jan 2018 15:04:56 +0000
Received: by mail-qt0-x244.google.com with SMTP id d54so9756749qtd.4
 for <xen-devel@lists.xenproject.org>; Sun, 28 Jan 2018 07:04:54 -0800 (PST)
In-Reply-To: <a33e605a-73d7-83b7-4472-14f66b6738be@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Len Brown <lenb@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgODoyMSBQTSwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPiB3cm90ZToKPiBPbiAyNi8wMS8xOCAxOTowOCwgQW5keSBTaGV2Y2hlbmtvIHdyb3Rl
Ogo+PiBPbiBUaHUsIEphbiAyNSwgMjAxOCBhdCA0OjM2IFBNLCBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+IHdyb3RlOgo+Pj4gQWRkIGEgZnVuY3Rpb24gdG8gZ2V0IHRoZSBhZGRyZXNz
IG9mIHRoZSBSU0RQIHRhYmxlLiBQZXIgZGVmYXVsdCB1c2UgYQo+Pj4gX193ZWFrIGFubm90YXRl
ZCBmdW5jdGlvbiBiZWluZyBhIG5vcC4KPj4KPj4gVGhlIHByb2JsZW0gd2l0aCB3ZWFrIGZ1bmN0
aW9ucyB0aGF0IHdlIGNhbid0IGhhdmUgbW9yZSB0aGFuIG9uZQo+PiBpbXBsZW1lbnRhdGlvbiBw
ZXIga2VybmVsIHdoaWxlIHdlIHdvdWxkIGxpa2UgdG8gYnVpbHQgc2V2ZXJhbCBjb2RlCj4+IHBh
dGhzLgo+Pgo+PiBJIGhhdmUgc3R1bWJsZWQgb24gdGhlIHNpbWlsYXIgc3R1ZmYgYW5kIHJlYWxp
emUgdGhhdC4KPj4KPj4gUGVyaGFwcywgb25lIG9mIHRoZSBzb2x1dGlvbiBpcyB0byBoYXZlIGFu
IGFkZGl0aW9uYWwgc3RydWN0IHVuZGVyCj4+IHg4Nl9pbml0IHRvIGFsdGVybmF0ZSBBQ1BJIHJl
bGF0ZWQgc3R1ZmYuCj4KPiBJIHRoaW5rIHdlIGNhbiBnbyB0aGF0IHJvdXRlIHdoZW4gYW5vdGhl
ciB1c2VyIG9mIHRoYXQgaW50ZXJmYWNlIGlzCj4gYXBwZWFyaW5nLgoKV2h5IG5vdCB0byBlc3Rh
Ymxpc2ggdGhlIHN0cnVjdD8gQXQgbGVhc3QgdGhpcyByb3V0ZSBJIHdvdWxkIGxpa2UgdG8KZ28g
d2l0aCBbMV0uCgpbMV06IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzEvMTcvODM0CgotLSAK
V2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
