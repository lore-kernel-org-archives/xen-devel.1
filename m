From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH for-4.10] SUPPORT.md: Add missing support
 lifetime information
Date: Thu, 26 Apr 2018 11:33:23 +0100
Message-ID: <20180426103323.ganajznaqw72ub27@citrix.com>
References: <1524737133-19633-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=erfw=hp=citrix.com=prvs=6479d1ba9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fBeDk-00056s-2w
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 10:33:48 +0000
Content-Disposition: inline
In-Reply-To: <1524737133-19633-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMTE6MDU6MzNBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGF0ZXMgYXJlIGZyb20gTGFycy4KPiAKPiBDQzogTGFycyBLdXJ0aCA8bGFycy5rdXJ0
aEBjaXRyaXguY29tPgo+IENDOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQ0M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDQzogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29t
Pgo+IC0tLQo+ICBTVVBQT1JULm1kIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL1NVUFBPUlQubWQgYi9T
VVBQT1JULm1kCj4gaW5kZXggOTYwMDJlYS4uMzI2ODI3MCAxMDA2NDQKPiAtLS0gYS9TVVBQT1JU
Lm1kCj4gKysrIGIvU1VQUE9SVC5tZAo+IEBAIC0xMSw4ICsxMSw4IEBAIGZvciB0aGUgZGVmaW5p
dGlvbnMgb2YgdGhlIHN1cHBvcnQgc3RhdHVzIGxldmVscyBldGMuCj4gIAo+ICAgICAgWGVuLVZl
cnNpb246IDQuMTAKPiAgICAgIEluaXRpYWwtUmVsZWFzZTogMjAxNy0xMi0xMwo+IC0gICAgU3Vw
cG9ydGVkLVVudGlsOiBUQkQKPiAtICAgIFNlY3VyaXR5LVN1cHBvcnQtVW50aWw6IFRCRAo+ICsg
ICAgU3VwcG9ydGVkLVVudGlsOiAyMDIwLTA2LTEyCj4gKyAgICBTZWN1cml0eS1TdXBwb3J0LVVu
dGlsOiAyMDIxLTEyLTEyCgpXZSBoYXZlIDE4IG1vbnRocyArIDE4IG1vbnRocyBzdXBwb3J0IHN0
YXRlbWVudCwgc286CgpTdXBwb3J0ZWQtVW50aWw6CgokIGRhdGUgLS1kYXRlICcyMDE3LTEyLTEz
ICsgMTggbW9udGhzJyArJUYKMjAxOS0wNi0xMwoKU2VjdXJpdHktU3VwcG9ydC1VbnRpbDoKCiQg
ZGF0ZSAtLWRhdGUgJzIwMTktMDYtMTMgKyAxOCBtb250aHMnICslRgoyMDIwLTEyLTEzCgpXZWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
