From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] tools/xenstore: try to get minimum
 thread stack size for watch thread
Date: Mon, 26 Feb 2018 12:12:57 +0000
Message-ID: <23187.63945.512718.538275@mariner.uk.xensource.com>
References: <20180226084612.2844-1-jgross@suse.com>
 <20180226094601.knt564ze5dmkzqvg@MacBook-Pro-de-Roger.local>
 <20180226103723.vksgomk3k4jyjvoy@citrix.com>
 <23187.63377.453301.479717@mariner.uk.xensource.com>
 <20180226120453.czxaazjmmq2s2n45@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=lxwb=fu=citrix.com=prvs=58832e820=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1eqHed-00013j-Ih
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 12:13:15 +0000
In-Reply-To: <20180226120453.czxaazjmmq2s2n45@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, jfehlig@suse.com, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB0b29scy94ZW5zdG9y
ZTogdHJ5IHRvIGdldCBtaW5pbXVtIHRocmVhZCBzdGFjayBzaXplIGZvciB3YXRjaCB0aHJlYWQi
KToKPiBJdCBpcyBhbHJlYWR5IGVuY2xvc2VkIGluIENPTkZJR19MaW51eC4gSSB0aGluayB0aGF0
IHNob3VsZCBiZSBlbm91Z2guCgpPaCwgSSBzZWUuICBJIGhhZCByZWFkIFVTRV9ETFNZTSBhcyBD
T05GSUdfRExTWU0sIGllICJkbHN5bSBpcwphdmFpbGFibGUiLiAgQSBiZXR0ZXIgbmFtZSBtaWdo
dCBiZSBVU0VfRExTWU1fTUlOU1RBQ0tfSEFDSyBidXQgSSdtCmhhcHB5IHdpdGggdGhlIHBhdGNo
IGFzIGlzLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgoKSSB3b3VsZCBsaWtlIGEgdGVzdCByZXBvcnQgZnJvbSBKaW0sIGFsdGhvdWdoIHRoZSB0aHJl
YWQgc3VnZ2VzdHMgdGhhdApKaW0ncyAqYWN0dWFsKiBwcm9ibGVtIHdhcyBzb21ldGhpbmcgZWxz
ZSBzbyB0aGF0IG1pZ2h0IG5vdCBiZQphcHBsaWNhYmxlLgoKSWFuLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
