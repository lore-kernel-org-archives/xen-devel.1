From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11 0/2] xenstore: reduce use of unsafe
 conversions
Date: Fri, 1 Jun 2018 20:54:14 +0200
Message-ID: <44418158-2ab7-4cd6-88e7-e080e3325c5c@suse.com>
References: <20180531130537.5037-1-marcello.seri@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r15b=it=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fOpBq-0001Nd-15
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 18:54:18 +0000
In-Reply-To: <20180531130537.5037-1-marcello.seri@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marcello Seri <marcello.seri@citrix.com>, xen-devel@lists.xenproject.org
Cc: Christian Lindig <christian.lindig@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEvMDUvMTggMTU6MDUsIE1hcmNlbGxvIFNlcmkgd3JvdGU6Cj4gV2hlbiB4ZW5zdG9yZSB3
YXMgdXBkYXRlZCB0byBzdXBwb3J0IHNhZmUtc3RyaW5nLCBzb21lIHVubmVjZXNzYXJ5Cj4gY29w
aWVzIHdlcmUgaW50cm9kdWNlZC4gQSBmdXJ0aGVyIHBhdGNoIHJlZHVjZWQgdGhlIGNvcGllcyBh
dCB0aGUgcHJpY2UKPiBvZiBtYW55IGNhbGxzIHRvIHVuc2FmZSBjb252ZXJzaW9ucyBiZXR3ZWVu
IGJ5dGVzIGFuZCBzdHJpbmdzLiBJbiB0aGUKPiBwb3J0IHdlIGFsc28gZGlkIG5vdCBub3RpY2Ug
dGhhdCBzb21lIEMgc3R1YnMgd2VyZSBzdGlsbCBpbmNvcnJlY3RseQo+IHVzaW5nIG9jYW1sIHN0
cmluZ3MgYXMgbXV0YWJsZSBwYXlsb2FkLgo+IAo+IFRoaXMgc2V0IG9mIHBhdGNoZXMgdXBkYXRl
cyB0aGUgQyBzdHVicyB0aGF0IHVzZSBtdXRhYmxlIHBheWxvYWRzIHBhc3NlZAo+IGZyb20gb2Nh
bWwsIGFuZCByZWR1Y2VzIHRoZSBhbW91bnQgb2YgdW5zYWZlIGNvbnZlcnNpb25zIHdoZXJlIHBv
c3NpYmxlCj4gd2l0aG91dCBmdXJ0aGVyIGluY3JlYXNpbmcgdGhlIG51bWJlciBvZiBjb3BpZXMu
Cj4gCj4gVGhpcyBzZWVtcyBhbHNvIHRvIGZpeCBzb21lIHVuY2xlYXIgaW5zdGFiaWxpdGllcyB0
aGF0IGFwcGVhcmVkIGFmdGVyCj4gdGhlIGZvcm1lciBwYXRjaCBpbnRyb2R1Y2luZyB0aGUgdW5z
YWZlIGNvbnZlcnNpb24gd2l0aCBzb21lIHZlcnNpb24gb2YKPiB0aGUgb2NhbWwgY29tcGlsZXIu
Cj4gCj4gTWFyY2VsbG8gU2VyaSAoMik6Cj4gICBvY2FtbC9saWJzL3hiOiB1c2UgYnl0ZXMgaW4g
cGxhY2Ugb2Ygc3RyaW5ncyBmb3IgbXV0YWJsZSBidWZmZXJzCj4gICBvY2FtbC94ZW5zdG9yZWQ6
IHJlZHVjZSB1c2Ugb2YgdW5zYWZlIGNvbnZlcnNpb25zCgpGb3IgdGhlIHNlcmllczoKClJlbGVh
c2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
