From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 7/7] docs/parse-support-md: Correctly handle
 footnotes for non-leaf sections
Date: Tue, 17 Apr 2018 16:57:46 +0200
Message-ID: <4d600041-1333-0e49-9d0f-802a0b669fef@suse.com>
References: <fa4e69bb-8278-4aec-960b-c0db32ef5503@cardoe.com>
 <1523976422-19799-1-git-send-email-ian.jackson@eu.citrix.com>
 <1523976422-19799-8-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8S3I-0005xu-Dd
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:57:48 +0000
In-Reply-To: <1523976422-19799-8-git-send-email-ian.jackson@eu.citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Lars Kurth <lars.kurth@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMTY6NDcsIElhbiBKYWNrc29uIHdyb3RlOgo+IE5vbi1sZWFmIHNlY3Rpb25z
IHdpdGggZm9vdG5vdGVzIG11c3QgaGF2ZSBhIHJvdyBvZiB0aGVpciBvd24sIGZvcgo+IGp1c3Qg
dGhhdCBzZWN0aW9uLCBiZWNhdXNlIGZvb3Rub3RlcyBvbmx5IGFwcGVhciBpZiB0aGVyZSBpcyBz
dGF0dXMKPiBpbmZvcm1hdGlvbi4KPiAKPiBJbiB0aGF0IGNhc2UsIHRoZSBmb290bm90ZSBhcHBs
aWVzIHRvIG9ubHkgdGhlIHJvd3MgZm9yIHRoYXQgc2VjdGlvbgo+IGluIHRoZSBtYXJrZG93biBk
b2N1bWVudCwgaWUgdGhhdCBSZWFsU2VjdC4KPiAKPiBBbmQgb2YgY291cnNlIGZvciBhIGxlYWYg
c2VjdGlvbiB0aGF0IGlzIHRydWUgdG9vLgo+IAo+IFNvIGZvciBmb290bm9lcyB3ZSBhbHdheXMg
d2FudCB0byB1c2UgYSByb3dzcGFuIG9mIHRoZSBudW1iZXIgb2YKPiBTdGF0dXMgZWxlbWVudHMg
aW4gdGhlIHNlY3Rpb24uICBTbyAoaSkgY2FsY3VsYXRlIHRoaXMgaW4KPiBjb3VudF9yb3dzX3Nl
Y3RsaXN0IGFuZCAoaWkpIHVzZSBpdCwgaW5zdGVhZCBvZiB0aGUgdG90YWwgbnVtYmVyIG9mCj4g
cm93cyBpbmNsdWRpbmcgYWxsIHRoZSBzdWJzZWN0aW9ucycsIHdoZW4gd3JpdGluZyBvdXQgdGhl
IGZvb3Rub3RlCj4gcmVmLgo+IAo+IFRoaXMgYnVnIGhhcyBiZWVuIHByZXNlbnQgaW4gdGhpcyBz
Y3JpcHQgc2luY2UgdGhlIGJlZ2lubmluZy4KPiAKPiBBbHNvLCB3aGlsZSB3ZSdyZSBoZXJlLCBz
dXBwcmVzcyB0aGUgcm93c3BhbiBpZiBpdCB3b3VsZCBiZSAxLgo+IAo+IFJlcG9ydGVkLWJ5OiBM
YXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEph
Y2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
