From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH-for-4.10/4.11] libxl: don't set gnttab
 limits in soft reset case
Date: Tue, 5 Feb 2019 11:43:24 +0000
Message-ID: <23641.30428.562362.817132@mariner.uk.xensource.com>
References: <20190117164059.29306-1-jgross@suse.com>
 <20190128133310.3d2ou7iwrcrsotcx@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v8BU=QM=citrix.com=prvs=93254badd=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gqz8n-0006fJ-0l
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 11:43:49 +0000
In-Reply-To: <20190128133310.3d2ou7iwrcrsotcx@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jim Fehlig <jfehlig@suse.com>, Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENILWZvci00LjEwLzQuMTFdIGxpYnhsOiBkb24ndCBz
ZXQgZ250dGFiIGxpbWl0cyBpbiBzb2Z0IHJlc2V0IGNhc2UiKToKPiBPbiBUaHUsIEphbiAxNywg
MjAxOSBhdCAwNTo0MDo1OVBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gSW4gY2Fz
ZSBvZiBzb2Z0IHJlc2V0IHRoZSBnbnR0YWIgbGltaXQgc2V0dGluZyB3aWxsIGZhaWwsIHNvIG9t
aXQgaXQuCj4gPiBTZXR0aW5nIG9mIG1heCB2Y3B1IGNvdW50IGlzIHBvaW50bGVzcyBpbiB0aGlz
IGNhc2UsIHRvbywgc28gd2UgY2FuCj4gPiBkcm9wIHRoYXQgYXMgd2VsbC4KPiA+IAo+ID4gV2l0
aG91dCB0aGlzIHBhdGNoIHNvZnQgcmVzZXQgd2lsbCBmYWlsIHdpdGg6Cj4gPiAKPiA+IGxpYnhs
OiBlcnJvcjogbGlieGxfZG9tLmM6MzYzOmxpYnhsX19idWlsZF9wcmU6IENvdWxkbid0IHNldCBn
cmFudCB0YWJsZSBsaW1pdHMKPiA+IAo+ID4gUmVwb3J0ZWQtYnk6IEppbSBGZWhsaWcgPGpmZWhs
aWdAc3VzZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Cj4gPiBUZXN0ZWQtYnk6IEppbSBGZWhsaWcgPGpmZWhsaWdAc3VzZS5jb20+Cj4gCj4g
UmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpQdXNoZWQgdG8gNC4x
MCBhbmQgNC4xMSwgdGhhbmtzLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
