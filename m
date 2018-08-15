From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/12] xen/gnttab: Pass max_{grant,
 maptrack}_frames into grant_table_create()
Date: Wed, 15 Aug 2018 06:51:19 -0600
Message-ID: <5B7421C702000078001DE5ED@prv1-mh.provo.novell.com>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <1534154469-6076-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534154469-6076-7-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA4LjE4IGF0IDEyOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLi4uIHJhdGhlciB0aGFuIHNldHRpbmcgdGhlIGxpbWl0cyB1cCBhZnRlciBkb21haW5f
Y3JlYXRlKCkgaGFzIGNvbXBsZXRlZC4KPiAKPiBUaGlzIHJlbW92ZXMgYWxsIHRoZSBnbnR0YWIg
aW5mcmFzdHJ1Y3R1cmUgZm9yIGNhbGN1bGF0aW5nIHRoZSBudW1iZXIgb2YgZG9tMAo+IGdyYW50
IGZyYW1lcywgb3B0aW5nIGluc3RlYWQgdG8gcmVxdWlyZSB0aGUgZG9tMCBjb25zdHJ1Y3Rpb24g
Y29kZSB0byBwYXNzIGEKPiBzYW5lIHZhbHVlIGluIHZpYSB0aGUgY29uZmlndXJhdGlvbi4KPiAK
PiBJbiBwcmFjdGljZSwgdGhpcyBub3cgbWVhbnMgdGhhdCB0aGVyZSBpcyBuZXZlciBhIHBhcnRp
YWxseSBjb25zdHJ1Y3RlZCBncmFudAo+IHRhYmxlIGZvciBhIHJlZmVyZW5jZS1hYmxlIGRvbWFp
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
