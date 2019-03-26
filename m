From: luca abeni <luca.abeni@santannapisa.it>
Subject: Re: [PATCH] x86/xen: Add "xen_timer_slop" command line
 option
Date: Tue, 26 Mar 2019 12:12:56 +0100
Message-ID: <20190326121256.76ceed71__19045.137420629$1553598843$gmane$org@luca64>
References: <1553279397-130201-1-git-send-email-ryan.thibodeaux@starlab.io>
 <abf65a68-9463-0f0e-1f51-6eefd3cacc88@oracle.com>
 <52bfeae7c256faec444b69efe58d363ad60c3fc5.camel@suse.com>
 <20190323114151.5cebf31b@sweethome>
 <20190325130530.56603806@luca64>
 <69e40698-f7ae-11c3-e4b7-dda4f1fadcf6@oracle.com>
 <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M4QG=R5=santannapisa.it=luca.abeni@srs-us1.protection.inumbo.net>)
 id 1h8k10-0002mF-6q
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2019 11:13:10 +0000
In-Reply-To: <a32c8b1d7866ee3b074b1d674b40e03e51dbd54a.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: jgross@suse.com, oleksandr_andrushchenko@epam.com, linux-kernel@vger.kernel.org, thibodux@gmail.com, ryan.thibodeaux@starlab.io, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKT24gVHVlLCAyNiBNYXIgMjAxOSAxMDoxMzozMiArMDEwMApEYXJpbyBGYWdnaW9s
aSA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKCj4gT24gTW9uLCAyMDE5LTAzLTI1IGF0IDA5
OjQzIC0wNDAwLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gPiBPbiAzLzI1LzE5IDg6MDUgQU0s
IGx1Y2EgYWJlbmkgd3JvdGU6ICAKPiA+ID4gCj4gPiA+IFRoZSBwaWN0dXJlIHNob3dzIHRoZSBs
YXRlbmNpZXMgbWVhc3VyZWQgd2l0aCBhbiB1bnBhdGNoZWQgZ3Vlc3QKPiA+ID4ga2VybmVsCj4g
PiA+IGFuZCB3aXRoIGEgZ3Vlc3Qga2VybmVsIGhhdmluZyBUSU1FUl9TTE9QIHNldCB0byAxMDAw
IChhcmJpdHJhcnkKPiA+ID4gc21hbGwKPiA+ID4gdmFsdWUgOikuCj4gPiA+IEFsbCB0aGUgZXhw
ZXJpbWVudHMgaGF2ZSBiZWVuIHBlcmZvcm1lZCBib290aW5nIHRoZSBoeXBlcnZpc29yCj4gPiA+
IHdpdGggYQo+ID4gPiBzbWFsbCB0aW1lcl9zbG9wICh0aGUgaHlwZXJ2aXNvcidzIG9uZSkgdmFs
dWUuIFNvLCB0aGV5IHNob3cgdGhhdAo+ID4gPiBkZWNyZWFzaW5nIHRoZSBoeXBlcnZpc29yJ3Mg
dGltZXJfc2xvcCBpcyBub3QgZW5vdWdoIHRvIG1lYXN1cmUKPiA+ID4gbG93IGxhdGVuY2llcyB3
aXRoIGN5Y2xpY3Rlc3QuICAKPiA+IAo+ID4gSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9uczoK
PiA+ICogRG9lcyBpdCBtYWtlIHNlbnNlIHRvIG1ha2UgdGhpcyBhIHR1bmFibGUgZm9yIG90aGVy
IGNsb2NrZXZlbnQKPiA+IGRldmljZXMKPiA+IGFzIHdlbGw/Cj4gPiAgCj4gU28sIEFGQUlVSSwg
dGhlIHRoaW5nIGlzIGFzIGZvbGxvd3MuIEluIGNsb2NrZXZlbnRzX3Byb2dyYW1fZXZlbnQoKSwK
PiB3ZSBrZWVwIHRoZSBkZWx0YSBiZXR3ZWVuIG5vdyBhbmQgdGhlIG5leHQgdGltZXIgZXZlbnQg
d2l0aGluCj4gZGV2LT5tYXhfZGVsdGFfbnMgYW5kIGRldi0+bWluX2RlbHRhX25zOgo+IAo+ICAg
ZGVsdGEgPSBtaW4oZGVsdGEsIChpbnQ2NF90KSBkZXYtPm1heF9kZWx0YV9ucyk7Cj4gICBkZWx0
YSA9IG1heChkZWx0YSwgKGludDY0X3QpIGRldi0+bWluX2RlbHRhX25zKTsKPiAKPiBGb3IgWGVu
ICh3ZWxsLCBmb3IgdGhlIFhlbiBjbG9jaykgd2UgaGF2ZToKPiAKPiAgIC5tYXhfZGVsdGFfbnMg
PSAweGZmZmZmZmZmLAo+ICAgLm1pbl9kZWx0YV9ucyA9IFRJTUVSX1NMT1AsCj4gCj4gd2hpY2gg
bWVhbnMgYSBndWVzdCBjYW4ndCBhc2sgZm9yIGEgdGltZXIgdG8gZmlyZSBlYXJsaWVyIHRoYW4g
MTAwdXMKWy4uLl0KCkkga25vdyB0aGlzIGlzIG5vdCBmdWxseSByZWxhdGVkIHdpdGggdGhlIGN1
cnJlbnQgZGlzY3Vzc2lvbiwgYnV0IGluCnRoZXNlIGRheXMgSSBoYWQgYSBsb29rIGF0IHRoZSBj
b2RlIGFnYWluLCBhbmQuLi4KVGhlIGNvbW1lbnQgZm9yIFRJTUVSX1NMT1AgaW4gYXJjaC94ODYv
eGVuL3RpbWUuYyBzYXlzOgoJLyogWGVuIG1heSBmaXJlIGEgdGltZXIgdXAgdG8gdGhpcyBtYW55
IG5zIGVhcmx5ICovCgpJc24ndCB0aGUgY29tbWVudCB3cm9uZz8gc2hvdWxkbid0IGl0IGJlICIu
Li5tYW55IG5zIGxhdGUiIGluc3RlYWQgb2YKImVhcmx5Ij8KCgoKCQkJVGhhbmtzLAoJCQkJTHVj
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
