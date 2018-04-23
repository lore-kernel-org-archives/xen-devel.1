From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH-for-4.11 v2] xpti: fix bug in double fault
 handling
Date: Mon, 23 Apr 2018 14:54:03 +0200
Message-ID: <d902c11d-e81d-b281-1c8c-cb15cb89e250@suse.com>
References: <20180423123806.12650-1-jgross@suse.com>
 <5ADDD64D02000078001BD917@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hhva=hm=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAayu-0006YU-09
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 12:54:08 +0000
In-Reply-To: <5ADDD64D02000078001BD917@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMTggMTQ6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIzLjA0LjE4IGF0
IDE0OjM4LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gV2hlbiBlbnRlcmluZyB0aGUgaHlw
ZXJ2aXNvciB2aWEgdGhlIGRvdWJsZSBmYXVsdCBoYW5kbGVyIHJlc2V0dGluZwo+PiB4ZW5fY3Iz
IHdhcyBtaXNzaW5nLiBUaGlzIGxlZCB0byBzd2l0Y2hpbmcgdG8gcHZfY3IzIHdoZW4gcmV0dXJu
aW5nCj4+IGZyb20gdGhlIG5leHQgZm9sbG93aW5nIGludGVycnVwdC4gU28gcmVwYWlyIHRoaXMg
aW4gb3JkZXIgdG8gYWxsb3cKPj4gaW50ZXJydXB0IGhhbmRsaW5nIHRvIHdvcmsgZXZlbiBhZnRl
ciBhIGRvdWJsZSBmYXVsdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+IAo+IFdpdGggcy9pbnRlcnJ1cHQvZXhjZXB0aW9uLyAob3Igcy9pbnRl
cnJ1cHQvaW50ZXJydXB0aW9uLykgb24gdGhlCj4gZGVzY3JpcHRpb24gKHdoaWNoIGlzIGVhc3kg
ZW5vdWdoIHRvIGRvIHdoaWxlIGNvbW1pdHRpbmcpCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJIHRha2UgaXQgdGhhdCB5b3VyIFJhYiBjYW4gYmUg
aW1wbGllZCBoZXJlLgoKQ29ycmVjdC4gOi0pCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
