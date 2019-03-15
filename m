From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
Date: Fri, 15 Mar 2019 17:29:28 +0100
Message-ID: <95fd63f7-e7fe-bbb0-a2df-a634d3f05867@suse.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com>
 <667b2ee6-fc6f-64e6-5977-2c69a9d97a95@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YWx5=RS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4pi9-00080T-6A
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 16:29:33 +0000
In-Reply-To: <667b2ee6-fc6f-64e6-5977-2c69a9d97a95@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxNjo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wMy8yMDE5
IDExOjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBAQCAtMTEwMCw2ICsxMTAwLDIwIEBAIHR5
cGVkZWYgc3RydWN0IHhlbl9zeXNjdGxfY3B1X3BvbGljeSB4ZW5fc3lzY3RsX2NwdV9wb2xpY3lf
dDsKPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9zeXNjdGxfY3B1X3BvbGljeV90KTsK
Pj4gICNlbmRpZgo+PiAgCj4+ICsvKgo+PiArICogWEVOX1NZU0NUTF9nZXRfY29uZmlnCj4+ICsg
Kgo+PiArICogUmV0dXJuIGd6aXAtZWQgLmNvbmZpZyBmaWxlCj4gCj4gSSBkb24ndCB0aGluayBp
dCBpcyB3aXNlIHRvIGJha2UgZ3ppcCBpbnRvIHRoZSBBUEkuwqAgVGhlc2UgZGF5cywgdGhlcmUK
PiByZWFsbHkgYXJlIGJldHRlciBvcHRpb25zIHRoYW4gZ3ppcCBib3RoIGluIHRlcm1zIG9mIGNv
bXByZXNzaW9uIHJhdGlvCj4gYW5kIGRlY29tcHJlc3Mgc3BlZWQuCj4gCj4gSSdkIHN1Z2dlc3Qg
anVzdCBzYXlpbmcgImZpbGUgbWF5IGJlIGNvbXByZXNzZWQiIGFuZCBsZWF2ZSBpdCB1cCB0byB0
aGUKPiBwYWNrYWdlcnMgYnVpbGQgc3lzdGVtIGFuZCBgeGxgIGNob2ljZXMgdG8gYWdyZWUgb24g
d2hpY2ggY29tcHJlc3Npb24KPiAoaWYgYW55KSB0byB1c2UuCgpJIGFtIG5vdCBjb252aW5jZWQg
dGhpcyBpcyBhIGdvb2QgaWRlYS4gSSB0aGluayB0aGUgZGF0YSBmb3JtYXQgc2hvdWxkCmJlIHNw
ZWNpZmllZC4KCkFuZCBUQkg6IHRoZSBkaWZmZXJlbmNlIGluIHNpemUgZm9yIGEgcmF0aGVyICJu
b3JtYWwiIC5jb25maWcgaXMgYWJvdXQKNTAgYnl0ZXMgKEkgdHJpZWQgZ3ppcCwgeHogYW5kIGJ6
aXAyIHdpdGggZ3ppcCBwcm9kdWNpbmcgdGhlIHNtYWxsZXN0CnJlc3VsdCkuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
