From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 12:17:18 +0200
Message-ID: <984c3825-4be4-a668-a137-946ece494265@suse.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
 <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTOJG-0001QB-EA
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:17:22 +0000
In-Reply-To: <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMjowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMi8wNS8yMDE5
IDEwOjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBwcmVlbXB0X2NvdW50KCkgYW5kIHRoZSBh
c3NvY2lhdGVkIHBlci1jcHUgdmFyaWFibGUgX19wcmVlbXB0X2NvdW50Cj4+IGFyZSB0ZXN0ZWQg
aW4gZGVidWcgYnVpbGQgb25seS4gU28gZHJvcCB0aGVtIGZvciBub24tZGVidWcgYnVpbGRzLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4g
SSdkIGJlIHRlbXB0ZWQgdG8gZm9sZCBwYXRjaGVzIDIgYW5kIDMgdG9nZXRoZXIsIGJlY2F1c2Ug
dGhleSBhcmUgYm90aAo+IHRoZSBzYW1lIGNoYW5nZSwgYW5kIGl0IHdvdWxkIHJlZHVjZSB0aGUg
Y2h1cm4uCgpGaW5lIHdpdGggbWUuCgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPiwgaWRlYWxseSB3aXRoIHRoZQo+IHR3byBmb2xkZWQgaW50
byBvbmUuCgpUaGFua3MsCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
