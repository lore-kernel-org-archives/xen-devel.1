From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 22:05:54 -0800
Message-ID: <CACMJ4GZbVO2pwOO3M1w+__FjZC6zZ79BFwbFce7pfO-gA6QSDA@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <20190110161623.yeydcl4kqvalmemp@legion>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qd1d=PT=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ghpxI-0002gl-Gz
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 06:06:08 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so11905419ljd.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 22:06:07 -0800 (PST)
In-Reply-To: <20190110161623.yeydcl4kqvalmemp@legion>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall@arm.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Rich Persaud <persaur@gmail.com>, Ross Philipson <ross.philipson@gmail.com>, James McKenzie <james@bromium.com>, Daniel Smith <dpsmith@apertussolutions.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgODoxNiBBTSBFcmljIENoYW51ZGV0IDxlcmljLmNoYW51
ZGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAwNi8wMS8xOSBhdCAxMTo0MnBtLCBDaHJpc3Rv
cGhlciBDbGFyayB3cm90ZToKPiA+K3BhcnRuZXJfcmluZ3NfcmVtb3ZlKHN0cnVjdCBkb21haW4g
KnNyY19kKQo+IDxzbmlwPgo+ID4rICAgICAgICAgICAgICAgIHJpbmdfaW5mbyA9IHJpbmdfZmlu
ZF9pbmZvKGRzdF9kLCAmc2VuZF9pbmZvLT5pZCk7Cj4gcmluZ19maW5kX2luZm8gaXMgZGVmaW5l
ZCBsYXRlciAoUEFUQ0ggMDcvMTUpLCBzaG91bGQgaXQgYmUgbW92ZWQgdG8KPiB0aGlzIHBhdGNo
IHNpbmNlIGl0IGlzIG5vdyB1c2VkIGhlcmU/CgpZZXMsIHlvdSdyZSByaWdodCAtLSB0aGFua3Mg
LS0gYW5kIEkgc2hvdWxkJ3ZlIGNhdWdodCB0aGF0LiBGaXhlZCBhbmQKd2lsbCBiZSB0aG9yb3Vn
aCB3aXRoIHRlc3RpbmcgdGhlIHNlcmllcyBpbmRpdmlkdWFsbHkgYmVmb3JlIHBvc3RpbmcKYWdh
aW4uCgpDaHJpc3RvcGhlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
