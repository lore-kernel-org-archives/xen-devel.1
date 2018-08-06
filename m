From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] xen/blkback: remove unused
 pers_gnts_lock from struct xen_blkif_ring
Date: Mon, 6 Aug 2018 18:20:37 +0200
Message-ID: <20180806162037.g32ilxvvzdfnwu7i__43054.4739625931$1533572366$gmane$org@mac>
References: <20180806113403.24728-1-jgross@suse.com>
 <20180806113403.24728-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kwsq=kv=citrix.com=prvs=7490ff4ab=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fmiFS-0001OH-VH
 for xen-devel@lists.xenproject.org; Mon, 06 Aug 2018 16:20:46 +0000
Content-Disposition: inline
In-Reply-To: <20180806113403.24728-6-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMDYsIDIwMTggYXQgMDE6MzQ6MDNQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBwZXJzX2dudHNfbG9jayBpc24ndCBiZWluZyB1c2VkIGFueXdoZXJlLiBSZW1vdmUg
aXQuCgpUaGF0IHdhcyBsaWtlbHkgYSBsZWZ0b3ZlciBmcm9tIHdoZW4gdGhlIGxpc3Qgb2YgcGVy
c2lzdGVudCBncmFudHMgd2FzCnNoYXJlZCBiZXR3ZWVuIHJpbmdzLgoKPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
