From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: fix build on rather old systems
Date: Fri, 11 Jan 2019 17:40:15 +0000
Message-ID: <23608.54527.696432.275991@mariner.uk.xensource.com>
References: <5C386B5F020000780020C96B@suse.com>
 <2e3ad15e-c056-b939-e725-d22ff19d6ab0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ayr2=PT=citrix.com=prvs=9077728fb=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gi0nD-0005D6-AJ
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 17:40:27 +0000
In-Reply-To: <2e3ad15e-c056-b939-e725-d22ff19d6ab0@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SnVlcmdlbiBHcm9zcyB3cml0ZXMgKCJSZTogW1BBVENIXSBsaWJ4bDogZml4IGJ1aWxkIG9uIHJh
dGhlciBvbGQgc3lzdGVtcyIpOgo+IE9uIDExLzAxLzIwMTkgMTE6MDksIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4gQ0xPTkVfTkVXSVBDIGhhcyBiZWVuIGludHJvZHVjZWQgaW4gTGludXggMi42LjE5
IG9ubHkgKGFuZCBpbnRvIGdsaWJjCj4gPiBhdCBhcm91bmQgdGhhdCB0aW1lIGFzIHdlbGwpLiBD
b3BlIHdpdGggaXQgYmVpbmcgdW5kZWZpbmVkIGFzIHdlbGwgYXMKPiA+IHdpdGggdGhlIHVuZGVy
bHlpbmcga2VybmVsIG5vdCBrbm93aW5nIG9mIGl0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKSSBrbm93IEkgYW0gdG9vIHNsb3cgd2l0aCB0
aGlzLCBidXQgZm9yIHRoZSByZWNvcmQ6CgpOYWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgoKT24gdHdvIGdyb3VuZHM6CgogMS4gVGhpcyBzaXR1YXRpb24g
c2hvdWxkIGJlIGhhbmRsZWQgYnkgZGlzYWJsaW5nIHRoZSBkbSByZXN0cmljdAogICAgZmVhdHVy
ZSwgbm90IHNpbGVudGx5IGZhbGxpbmcgYmFjayB0byBsb3dlciBwcm90ZWN0aW9uLgoKIDIuIFN0
eWxlLCAjaWZkZWZmZXJ5LgoKSSBkb24ndCBhZ3JlZSB0aGF0IHRoZSB1bnNoYXJlIG9mIHRoZSBJ
UEMgbmFtZXNwYWNlIGlzIGEgYG5pY2UgdG8KaGF2ZScuICBXaXRob3V0IGl0LCBhIHJvZ3VlIHFl
bXUgbWlnaHQgYmUgYWJsZSB0byBkbyBhIG51bWJlciBvZiBiYWQKdGhpbmdzLgoKQmFja2dyb3Vu
ZDogQUlVSSBpbiBrZXJuZWxzIHdpdGhvdXQgQ0xPTkVfTkVXSVBDLCB0aGUgSVBDIG5hbWVzcGFj
ZSBpcwpzaGFyZWQgd2l0aCB0aGUgbmV0d29yayBuYW1lc3BhY2UuICBCdXQgb2YgY291cnNlIHdo
YXQgbWF0dGVycyBpcyB3aGF0CnRoZSAqcnVudGltZSoga2VybmVsIHN1cHBvcnRzLCBub3QgdGhl
IGJ1aWxkLXRpbWUga2VybmVsLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
