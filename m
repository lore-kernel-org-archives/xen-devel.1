From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Tue, 23 Jan 2018 07:38:48 +0100
Message-ID: <24e10a30-003c-61e2-7954-d10859164a30@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122214509.GQ24995@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bxvh=es=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1edsEN-0003mC-QW
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 06:38:51 +0000
In-Reply-To: <20180122214509.GQ24995@char.us.oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, dfaggioli@suse.com, jbeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMTggMjI6NDUsIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90ZToKPiBPbiBNb24s
IEphbiAyMiwgMjAxOCBhdCAwMTozMjo0NFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
PiBBcyBhIHByZXBhcmF0aW9uIGZvciBkb2luZyBwYWdlIHRhYmxlIGlzb2xhdGlvbiBpbiB0aGUg
WGVuIGh5cGVydmlzb3IKPj4gaW4gb3JkZXIgdG8gbWl0aWdhdGUgIk1lbHRkb3duIiB1c2UgZGVk
aWNhdGVkIHN0YWNrcywgR0RUIGFuZCBUU1MgZm9yCj4+IDY0IGJpdCBQViBkb21haW5zIG1hcHBl
ZCB0byB0aGUgcGVyLWRvbWFpbiB2aXJ0dWFsIGFyZWEuCj4+Cj4+IFRoZSBwZXItdmNwdSBzdGFj
a3MgYXJlIHVzZWQgZm9yIGVhcmx5IGludGVycnVwdCBoYW5kbGluZyBvbmx5LiBBZnRlcgo+PiBz
YXZpbmcgdGhlIGRvbWFpbidzIHJlZ2lzdGVycyBzdGFja3MgYXJlIHN3aXRjaGVkIGJhY2sgdG8g
dGhlIG5vcm1hbAo+PiBwZXIgcGh5c2ljYWwgY3B1IG9uZXMgaW4gb3JkZXIgdG8gYmUgYWJsZSB0
byBhZGRyZXNzIG9uLXN0YWNrIGRhdGEKPj4gZnJvbSBvdGhlciBjcHVzIGUuZy4gd2hpbGUgaGFu
ZGxpbmcgSVBJcy4KPj4KPj4gQWRkaW5nICVjcjMgc3dpdGNoaW5nIGJldHdlZW4gc2F2aW5nIG9m
IHRoZSByZWdpc3RlcnMgYW5kIHN3aXRjaGluZwo+PiB0aGUgc3RhY2tzIHdpbGwgZW5hYmxlIHRo
ZSBwb3NzaWJpbGl0eSB0byBydW4gZ3Vlc3QgY29kZSB3aXRob3V0IGFueQo+PiBwZXIgcGh5c2lj
YWwgY3B1IG1hcHBpbmcsIGkuZS4gYXZvaWRpbmcgdGhlIHRocmVhdCBvZiBhIGd1ZXN0IGJlaW5n
Cj4+IGFibGUgdG8gYWNjZXNzIG90aGVyIGRvbWFpbnMgZGF0YS4KPj4KPj4gV2l0aG91dCBhbnkg
ZnVydGhlciBtZWFzdXJlcyBpdCB3aWxsIHN0aWxsIGJlIHBvc3NpYmxlIGZvciBlLmcuIGEKPj4g
Z3Vlc3QncyB1c2VyIHByb2dyYW0gdG8gcmVhZCBzdGFjayBkYXRhIG9mIGFub3RoZXIgdmNwdSBv
ZiB0aGUgc2FtZQo+PiBkb21haW4sIGJ1dCB0aGlzIGNhbiBiZSBlYXNpbHkgYXZvaWRlZCBieSBh
IGxpdHRsZSBQVi1BQkkgbW9kaWZpY2F0aW9uCj4+IGludHJvZHVjaW5nIHBlci1jcHUgdXNlciBh
ZGRyZXNzIHNwYWNlcy4KPj4KPj4gVGhpcyBzZXJpZXMgaXMgbWVhbnQgYXMgYSByZXBsYWNlbWVu
dCBmb3IgQW5kcmV3J3MgcGF0Y2ggc2VyaWVzOgo+PiAieDg2OiBQcmVyZXF1aXNpdGUgd29yayBm
b3IgYSBYZW4gS0FJU0VSIHNvbHV0aW9uIi4KPj4KPj4gV2hhdCBuZWVkcyB0byBiZSBkb25lOgo+
PiAtIHZlcmlmeSBsaXZlcGF0Y2hpbmcgaXMgc3RpbGwgd29ya2luZwo+IAo+IElzIHRoZXJlIGFu
IGdpdCByZXBvIGZvciB0aGlzPwoKaHR0cHM6Ly9naXRodWIuY29tL2pncm9zczEveGVuLmdpdCB4
cHRpCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
