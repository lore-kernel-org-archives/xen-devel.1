From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libfsimage: Add `XEN' to environment
 variable name
Date: Tue, 5 Mar 2019 17:09:36 +0100
Message-ID: <c99f7c5d-faf0-086c-a912-03dc00dabd37@suse.com>
References: <34d7e71d-f3c4-c236-0247-4cc4f132a2e9@suse.com>
 <20190305153730.28523-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1CdR-0005Sc-3u
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:09:41 +0000
In-Reply-To: <20190305153730.28523-1-ian.jackson@eu.citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNjozNywgSWFuIEphY2tzb24gd3JvdGU6Cj4gVGhpcyBsaWJyYXJ5LCB3
aGljaCBpcyBwcml2YXRlIHRvIFhlbiBhbmQgd2FzIHByb3Blcmx5IG5hbWVzcGFjZWQgaW4KPiAg
IDFhODE0NzExODgxYmViMTdmMDczZjVmNTdlMjdlNWJkNGRhMWI5NTYKPiAgIHRvb2xzL2xpYmZz
aW1hZ2U6IEFkZCBgeGVuJyB0byAuaCBuYW1lcyBhbmQgcHJpbmNpcGFsIC5zbyBuYW1lCj4gaG9u
b3VycyBhbiBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byBvdmVycmlkZSB0aGUgZGlyZWN0b3J5IHdo
ZXJlCj4gc2hhcmVkIG9iamVjdHMgKGllIGZpbGVzeXN0ZW0gcGx1Z2lucykgYXJlIHRvIGJlIGxv
YWRlZCBmcm9tLgo+IAo+IFJlbmFtZSB0aGF0IHZhcmlhYmxlIGZyb20gRlNJTUFHRV9GU0RJUiB0
byBYRU5fRlNJTUFHRV9GU0RJUiwgdG8gZ2l2ZQo+IGl0IGEgcHJvcGVyIG5hbWVzcGFjZSBwcmVm
aXguCj4gCj4gTm90aGluZyBpbiB4ZW4uZ2l0IHNldHMgdGhpcyB2YXJpYWJsZS4gIFRoZSB0aHJl
ZSBoaXRzIGZvciB0aGUgc3RyaW5nCj4gYEZTSU1BR0VfRlNESVInIGFyZSB0aGlzIGdldGVudiwg
YW5kIHR3byByZWZlcmVuY2VzIHRvIGEgY29tcGlsZS10aW1lCj4gbWFuaWZlc3QgY29uc3RhbnQg
d2hpY2ggcHJvdmlkZXMgdGhlIGRlZmF1bHQgdmFsdWUgKHRoZSAtRCB3aGljaCBzZXRzCj4gaXQs
IGFuZCB0aGUgcGxhY2UgaXQgaXMgdXNlZCkuCj4gCj4gSSBoYXZlIGFsc28gY2hlY2tlZCB0aGUg
Y3VycmVudCBEZWJpYW4gWGVuIHBhY2thZ2UgaW4gYnVzdGVyIGFuZCB0aGUKPiB2YXJpYWJsZSBp
cyBub3Qgc2V0IHRoZXJlIGVpdGhlci4KPiAKPiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KPiBDQzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpS
ZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
