From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 1/3] xen: Introduce
 vcpu_sleep_nosync_locked()
Date: Thu, 26 Apr 2018 08:11:41 +0200
Message-ID: <34d1591e-daf0-b1b8-9d9b-bab2c7d08ae9@suse.com>
References: <20180411122518.26270-1-george.dunlap@citrix.com>
 <20180411122518.26270-2-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=thde=hp=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fBa8A-0002OB-PY
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 06:11:46 +0000
In-Reply-To: <20180411122518.26270-2-george.dunlap@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDQvMTggMTQ6MjUsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gVGhlcmUgYXJlIGEgbG90
IG9mIHBsYWNlcyB3aGljaCByZWxlYXNlIGEgbG9jayBiZWZvcmUgY2FsbGluZwo+IHZjcHVfc2xl
ZXBfbm9zeW5jKCksIHdoaWNoIHRoZW4ganVzdCBncmFicyB0aGUgbG9jayBhZ2Fpbi4gIFRoaXMg
aXMKPiBub3Qgb25seSBhIHdhc3RlIG9mIHRpbWUsIGJ1dCBsZWFkcyB0byBtb3JlIGNvZGUgZHVw
bGljYXRpb24gKHNpbmNlCj4geW91IGhhdmUgdG8gY29weS1hbmQtcGFzdGUgcmVjaXBlcyByYXRo
ZXIgdGhhbiBjYWxsaW5nIGEgdW5pZmllZAo+IGZ1bmN0aW9uKSwgd2hpY2ggaW4gdHVybiBsZWFk
cyB0byBhbiBpbmNyZWFzZWQgY2hhbmNlIG9mIGJ1Z3MuCj4gCj4gSW50cm9kdWNlIHZjcHVfc2xl
ZXBfbm9zeW5jX2xvY2tlZCgpLCB3aGljaCBjYW4gYmUgY2FsbGVkIGlmIHlvdQo+IGFscmVhZHkg
aG9sZCB0aGUgc2NoZWR1bGUgbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFw
IDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
