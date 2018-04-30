From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH for-4.11 v2 0/2] Add Designated Reviewer
 (R:) to MAINTAINERS (plus a test case)
Date: Mon, 30 Apr 2018 15:41:03 +0100
Message-ID: <23271.11007.427206.269959@mariner.uk.xensource.com>
References: <cover.1524851673.git.lars.kurth@citrix.com>
 <5AE6CC2502000078001BF7A0@prv1-mh.provo.novell.com>
 <8A88031C-5A37-43BB-A62D-95495D41AA5C@citrix.com>
 <5AE6D48702000078001BF80C@prv1-mh.provo.novell.com>
 <23271.6343.553058.630893@mariner.uk.xensource.com>
 <C9C51551-4B73-436D-93D7-9E5CE99B433A@citrix.com>
 <5AE71C9F02000078001BF990@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nxjg=ht=citrix.com=prvs=651ef1d7e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fD9zd-00025F-Mh
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 14:41:29 +0000
In-Reply-To: <5AE71C9F02000078001BF990@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xMSB2MiAwLzJdIEFkZCBEZXNp
Z25hdGVkIFJldmlld2VyIChSOikgdG8gTUFJTlRBSU5FUlMgKHBsdXMgYSB0ZXN0IGNhc2UpIik6
Cj4gT24gMzAuMDQuMTggYXQgMTU6MjksIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+IHdyb3RlOgo+
ID4gVGhhdCBpcyBjbGVhcmVyOiBJIGNvcGllZCB0aGUgdGV4dCBmcm9tIHRoZSBMaW51eCBtYWlu
dGFpbmVycyBmaWxlLiAKPiAKPiBBaCwgaW5kZWVkLiBTbyBmYXIgaXQgd2Fzbid0IHJlYWxseSBj
bGVhciB0byBtZSB3aGV0aGVyICJkZXNpZ25hdGVkIiBpbXBsaWVzCj4gZnVydGhlciBwcml2aWxl
Z2UuCgpSaWdodC4gIEl0IGRvZXMgaGF2ZSBzdWNoIGEgY29ubm90YXRpb24uICBIZW5jZSBteSBz
dWdnZXN0aW9uLgpJIHRha2UgaXQgdGhhdCB5b3UgYXJlIGhhcHB5IHdpdGggdGhpcyBwYXRjaCBw
YWlyIG5vdy4KCj4gPiBASmFuOiBsZXQgbWUga25vdyB3aGV0aGVyIHlvdSB3YW50IG1lIHRvIHJl
LXJvbGwgdGhlIHNlcmllcyB3aXRoIHRoZSB0ZXh0IAo+ID4gY2hhbmdlLgo+IAo+IFNpbmNlIEkg
dGFrZSBJYW4ncyByZXBseSBhcyBoaW0gdm9sdW50ZWVyaW5nIHRvIGNvbW1pdCBib3RoLCB0aGF0
IHdvdWxkIHRoZW4KPiByZWFsbHkgYmUgdXAgdG8gaGltLgoKV2VsbCwgSSB3b3VsZG4ndCB3YW50
IHRvIGp1c3QgY29tbWl0IHdpbGx5LW5pbGx5IHNvbWV0aGluZyB0aGF0IHlvdQpoYWQgdW5yZXNv
bHZlZCBxdWVzdGlvbnMgYWJvdXQuICBCdXQgSSB0aGluayB3ZSBhcmUgYWxsIGNvbnRlbnQgbm93
LApzbywgeWVzLCBMYXJzLCBwbGVhc2UgcmVzcGluIHRoZSB0d28gcGF0Y2hlcyB3aXRoIHRoYXQg
dGV4dC4gIEluIHRoZQpyaWdodCBvcmRlciBwbGVhc2UgOi0pLgoKVGhhbmtzLApJYS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
