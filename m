From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4] xen: avoid crash in disable_hotplug_cpu
Date: Tue, 11 Sep 2018 12:51:20 +0200
Message-ID: <2456637d-373a-729a-62fe-8c4799900233__19462.9513811835$1536663005$gmane$org@suse.com>
References: <20180907143135.29608-1-olaf@aepfle.de>
 <4f623671-e1aa-1804-449c-a26b0c4b9ce9@oracle.com>
 <20180911095258.5ed9e9b7.olaf@aepfle.de>
 <20180911124808.18dfe8bf.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=i2ua=lz=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fzgGT-0000G9-Cx
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 10:51:25 +0000
In-Reply-To: <20180911124808.18dfe8bf.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDkvMTggMTI6NDgsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IEFtIFR1ZSwgMTEgU2VwIDIw
MTggMDk6NTI6NTggKzAyMDAKPiBzY2hyaWViIE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT46
Cj4gCj4+IEFzIErDvHJnZW4gc3VnZ2VzdGVkIGluIGFub3RoZXIgbWFpbCwgWGVuIHNob3VsZCBw
cm9iYWJseSBkaXNhYmxlIGhvdHBsdWdnaW5nCj4+IGZvciBjcHUjMCBpbiB0aGUgZ2VuZXJpYyBz
ZXR1cCBjb2RlLiBUaGVuIGNwdV9pc19ob3RwbHVnZ2FibGUoY3B1KSB3b3VsZAo+PiBkbyB0aGUg
cmlnaHQgdGhpbmcuCj4gCj4gVGhlIHJlbGV2YW50IGNvZGUgaXMgYWxsIHByaXZhdGUgdG8gYXJj
aC94ODYva2VybmVsL3RvcG9sb2d5LmMuCj4gVGhlcmUgaXMgbm8gd2F5IHRvIHNldCAuaG90cGx1
Z2dhYmxlIHByaW9yIHRvIHJlZ2lzdGVyX2NwdS4KPiBJIGd1ZXNzIHlvdSBuZWVkIHRvIHdvcmsg
dGhhdCBvdXQgd2l0aCB0aGUgeDg2IG1haW50YWluZXJzLgoKT2theSwgSSdsbCBkbyB0aGF0LgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
