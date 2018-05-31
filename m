From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.11 0/2] xenstore: reduce use of unsafe
 conversions
Date: Thu, 31 May 2018 16:14:46 +0200
Message-ID: <32d1a670-6769-e620-a189-e95ba0f9beac@suse.com>
References: <20180531130537.5037-1-marcello.seri@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qi+r=is=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fOOLq-0004lP-Ou
 for xen-devel@lists.xenproject.org; Thu, 31 May 2018 14:14:50 +0000
In-Reply-To: <20180531130537.5037-1-marcello.seri@citrix.com>
Content-Language: en-US
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
CgpUaGlzIGlzIHJhdGhlciB2YWd1ZS4KCkNhbiB5b3UgY29uZmlybSB0aGF0IG94ZW5zdG9yZWQg
aXMgbm93IGFzIHN0YWJsZSBhcyBpdCB3YXMgd2l0aG91dCB0aGUKc2FmZS1zdHJpbmcgcGF0Y2hl
cz8KCkNvdWxkIHlvdSBwbGVhc2UgbWVudGlvbiB0aGUgY29tbWl0IG9mIHRoZSBwYXRjaCB5b3Ug
YXJlIGZpeGluZyBpbiB0aGUKcmVsYXRlZCBjb21taXQgbWVzc2FnZT8gSSdkIGxpa2UgdG8ga25v
dyB3aGljaCBvZiB0aGUgdHdvIHBhdGNoZXMgaXMKdGhlIHJlYWwgZml4IGFuZCB3aGljaCBpcyAi
b25seSIgc29tZSBpbXByb3ZlbWVudCBvZiBjb2RlLgoKV2UgYXJlIHJhdGhlciBjbG9zZSB0byB0
aGUgcmVsZWFzZSwgc28gSSdtIGhlc2l0YXRpbmcgdG8gYWNjZXB0IGNsZWFudXAKcGF0Y2hlcyBu
b3cuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
