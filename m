From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/5] doc: correct livepatch.markdown
 syntax
Date: Mon, 7 May 2018 12:30:33 +0200
Message-ID: <49bcd73a-ffdf-8c34-3c48-d7a97f8fdc24@suse.com>
References: <20180507101608.797-1-jgross@suse.com>
 <20180507101608.797-4-jgross@suse.com>
 <9451c973-62e7-38a6-b264-450a854f2624@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=25p9=h2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFdPg-0006VJ-Pm
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:30:36 +0000
In-Reply-To: <9451c973-62e7-38a6-b264-450a854f2624@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMTggMTI6MjMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDcvMDUvMTggMTE6
MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+ICJtYWtlIC1DIGRvY3MgYWxsIiBmYWlscyBkdWUg
dG8gaW5jb3JyZWN0IG1hcmtkb3duIHN5bnRheCBpbgo+PiBsaXZlcGF0Y2gubWFya2Rvd24uIENv
cnJlY3QgaXQuCj4gCj4gV2hpY2ggdmVyc2lvbiBvZiBtYXJrZG93biwgb29pP8KgIFZlcnNpb24g
MS4wLjEgc2VlbXMgZmluZSB3aXRoIHRoaXMuCj4gCgouLi4KL3Vzci9iaW4vcGFuZG9jIC0tbnVt
YmVyLXNlY3Rpb25zIC0tdG9jIC0tc3RhbmRhbG9uZQptaXNjL2xpdmVwYXRjaC5tYXJrZG93biAt
LW91dHB1dCBwZGYvbWlzYy9saXZlcGF0Y2gucGRmCiEgTGFUZVggRXJyb3I6IENvbW1hbmQgXHRl
eHRxdW90ZXNpbmdsZSB1bmF2YWlsYWJsZSBpbiBlbmNvZGluZyBUMS4KClNlZSB0aGUgTGFUZVgg
bWFudWFsIG9yIExhVGVYIENvbXBhbmlvbiBmb3IgZXhwbGFuYXRpb24uClR5cGUgIEggPHJldHVy
bj4gIGZvciBpbW1lZGlhdGUgaGVscC4KIC4uLgoKbC4yNTEgLi4ubmN0aW9uXCB0b1wgZGlyZWN0
bHlcIGp1bXBcIHRvXCB0aGVcIG5ld30KCnBhbmRvYzogRXJyb3IgcHJvZHVjaW5nIFBERgpNYWtl
ZmlsZToyNTc6IHJlY2lwZSBmb3IgdGFyZ2V0ICdwZGYvbWlzYy9saXZlcGF0Y2gucGRmJyBmYWls
ZWQKbWFrZTogKioqIFtwZGYvbWlzYy9saXZlcGF0Y2gucGRmXSBFcnJvciA0MwoKZ3Jvc3NARGVz
a3RvcDp+L3hlbi9kb2NzPiAvdXNyL2Jpbi9wYW5kb2MgLS12ZXJzaW9uCnBhbmRvYyAxLjE5LjIu
MQpDb21waWxlZCB3aXRoIHBhbmRvYy10eXBlcyAxLjE3LjAuNSwgdGV4bWF0aCAwLjkuMSwgc2t5
bGlnaHRpbmcgMC4xLjEuNQpEZWZhdWx0IHVzZXIgZGF0YSBkaXJlY3Rvcnk6IC9ob21lL2dyb3Nz
Ly5wYW5kb2MKQ29weXJpZ2h0IChDKSAyMDA2LTIwMTYgSm9obiBNYWNGYXJsYW5lCldlYjogIGh0
dHA6Ly9wYW5kb2Mub3JnCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
