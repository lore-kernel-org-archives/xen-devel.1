From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/xen: init %gs very early to avoid page
 faults with stack protector
Date: Thu, 1 Feb 2018 13:24:39 +0100
Message-ID: <24614db8-7369-8178-f690-7c1614e2c0c9__15605.7749911726$1517487824$gmane$org@suse.com>
References: <20180201121601.1268-1-jgross@suse.com>
 <66ad81d7-0230-d0a5-f4fb-9dbbd8162884@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=n8z1=e3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ehDv1-0002HN-MM
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 12:24:43 +0000
In-Reply-To: <66ad81d7-0230-d0a5-f4fb-9dbbd8162884@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMTggMTM6MjIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDEvMDIvMTggMTI6
MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFdoZW4gcnVubmluZyBhcyBYZW4gcHYgZ3Vlc3Qg
JWdzIGlzIGluaXRpYWxpemVkIHNvbWUgdGltZSBhZnRlcgo+PiBDIGNvZGUgaXMgc3RhcnRlZC4g
RGVwZW5kaW5nIG9uIHN0YWNrIHByb3RlY3RvciB1c2FnZSB0aGlzIG1pZ2h0IGJlCj4+IHRvbyBs
YXRlLCByZXN1bHRpbmcgaW4gcGFnZSBmYXVsdHMuCj4+Cj4+IFNvIHNldHVwICVncyBhbmQgTVNS
X0dTX0JBU0UgaW4gYXNzZW1ibHkgY29kZSBhbHJlYWR5Lgo+Pgo+PiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4+IC0tLQo+PiAgYXJjaC94ODYveGVuL3hlbi1oZWFkLlMgfCAxNCArKysrKysrKysrKysr
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi94ZW4taGVhZC5TIGIvYXJjaC94ODYveGVuL3hlbi1oZWFkLlMKPj4gaW5k
ZXggNDk3Y2M1NWEwYzE2Li5iNDdkODcwNzZlZmIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L3hl
bi94ZW4taGVhZC5TCj4+ICsrKyBiL2FyY2gveDg2L3hlbi94ZW4taGVhZC5TCj4+IEBAIC05LDcg
KzksOSBAQAo+PiAgCj4+ICAjaW5jbHVkZSA8YXNtL2Jvb3QuaD4KPj4gICNpbmNsdWRlIDxhc20v
YXNtLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL21zci5oPgo+PiAgI2luY2x1ZGUgPGFzbS9wYWdlX3R5
cGVzLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3BlcmNwdS5oPgo+PiAgI2luY2x1ZGUgPGFzbS91bndp
bmRfaGludHMuaD4KPj4gIAo+PiAgI2luY2x1ZGUgPHhlbi9pbnRlcmZhY2UvZWxmbm90ZS5oPgo+
PiBAQCAtMzUsNiArMzcsMTggQEAgRU5UUlkoc3RhcnR1cF94ZW4pCj4+ICAJbW92ICVfQVNNX1NJ
LCB4ZW5fc3RhcnRfaW5mbwo+PiAgCW1vdiAkaW5pdF90aHJlYWRfdW5pb24rVEhSRUFEX1NJWkUs
ICVfQVNNX1NQCj4+ICAKPj4gKwkvKiBTZXQgdXAgJWdzLgo+PiArCSAqCj4+ICsJICogVGhlIGJh
c2Ugb2YgJWdzIGFsd2F5cyBwb2ludHMgdG8gdGhlIGJvdHRvbSBvZiB0aGUgaXJxc3RhY2sKPj4g
KwkgKiB1bmlvbi4gIElmIHRoZSBzdGFjayBwcm90ZWN0b3IgY2FuYXJ5IGlzIGVuYWJsZWQsIGl0
IGlzCj4+ICsJICogbG9jYXRlZCBhdCAlZ3M6NDAuICBOb3RlIHRoYXQsIG9uIFNNUCwgdGhlIGJv
b3QgY3B1IHVzZXMKPj4gKwkgKiBpbml0IGRhdGEgc2VjdGlvbiB0aWxsIHBlciBjcHUgYXJlYXMg
YXJlIHNldCB1cC4KPj4gKwkgKi8KPj4gKwltb3ZsCSRNU1JfR1NfQkFTRSwlZWN4Cj4+ICsJbW92
cQkkSU5JVF9QRVJfQ1BVX1ZBUihpcnFfc3RhY2tfdW5pb24pLCVyYXgKPj4gKwljZHEKPj4gKwl3
cm1zcgo+IAo+IFlvdSBzdXJlbHkgd2FudCBhICNpZmRlZiBfX3g4Nl82NF9fID/CoCBUaGlzIHBh
dGggaXMgY29tbW9uIHRvIHRoZSAzMmJpdAo+IGVudHJ5IGFzIHdlbGw/CgpPaCwgaW5kZWVkISBU
aGFua3MgZm9yIG5vdGljaW5nLgoKVjIgY29taW5nIHNvb24uLi4KCgpKdWVyZ2VuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
