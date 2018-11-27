From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xl: free bitmaps on exit
Date: Tue, 27 Nov 2018 13:01:00 +0000
Message-ID: <20181127130100.2sdiwnczstonmsq7@zion.uk.xensource.com>
References: <20181127100608.4197-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q9XT=OG=citrix.com=prvs=862b52565=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRczD-0003Pm-47
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 13:01:07 +0000
Content-Disposition: inline
In-Reply-To: <20181127100608.4197-1-olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMTE6MDY6MDhBTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gRXZlcnkgaW52b2NhdGlvbiBvZiB4bCB2aWEgdmFsZ3JpbmQgd2lsbCBzaG93IHRocmVl
IGxlYWtzLgo+IFNpbmNlIGxpYnhsX2JpdG1hcF9hbGxvYyB1c2VzIE5PR0MsIHRoZSBjYWxsZXIg
aGFzIHRvIGZyZWUgdGhlIG1lbW9yeQo+IGFmdGVyIHVzZS4gQW5kIHNpbmNlIHhsX2N0eF9mcmVl
IG1pZ2h0IGJlIGNhbGxlZCBiZWZvcmUKPiBwYXJzZV9nbG9iYWxfY29uZmlnLCBhbHNvIG1vdmUg
dGhlIGxpYnhsX2JpdG1hcF9pbml0IGNhbGxzIGludG8KPiB4bF9jdHhfYWxsb2MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgoKQWNrZWQtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpUaGFua3MgZm9yIGZpeGluZyB0aGlzLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
