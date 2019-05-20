From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: fix libxl_domain_need_memory after
 899433f149d
Date: Mon, 20 May 2019 14:50:32 +0100
Message-ID: <23778.45224.28897.55507@mariner.uk.xensource.com>
References: <20190517170555.17423-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSih3-0003fN-67
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:51:09 +0000
In-Reply-To: <20190517170555.17423-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBmaXggbGlieGxfZG9tYWluX25lZWRfbWVt
b3J5IGFmdGVyIDg5OTQzM2YxNDlkIik6Cj4gQWZ0ZXIgODk5NDMzZjE0OWQgbGlieGwgbmVlZHMg
dG8ga25vdyB0aGUgY29udGVudCBvZiBkX2NvbmZpZyB0bwo+IGRldGVybWluZSB3aGljaCBRRU1V
IGlzIHVzZWQuIFRoZSBjb2RlIGlzIGNoYW5nZWQgc3VjaCB0aGF0Cj4gbGlieGxfX2RvbWFpbl9z
ZXRfZGV2aWNlX21vZGVsIG5lZWRzIHRvIGJlIGNhbGxlZCBiZWZvcmUKPiBsaWJ4bF9fZG9tYWlu
X2J1aWxkX2luZm9fc2V0ZGVmYXVsdC4KPiAKPiBUaGlzIGlzIGZpbmUgZm9yIGxpYnhsIGNvZGUs
IGJ1dCBpdCBpcyBwcm9ibGVtYXRpYyBmb3IKPiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnksIHdo
aWNoIGlzIHRoZSBvbmx5IHB1YmxpYyBBUEkgdGhhdCB0YWtlcyBhCj4gYnVpbGRfaW5mby4gVG8g
YXZvaWQgYnJlYWsgaXRzIHVzZXJzLCBwcm92aWRlIGEgY29tcGF0aWJpbGl0eSBzZXR0aW5nCj4g
aW5zaWRlIHRoYXQgZnVuY3Rpb24uCgpUaGlzIGxvb2tzIHBsYXVzaWJsZSB0byBtZS4gIEkgc2Vl
IHRoYXQgdGhpcyBmdW5jdGlvbiBhbHJlYWR5IG1ha2VzIGEKY29weSBvZiB0aGUgYl9pbmZvLCBz
byB3ZSBkbyBub3QgZW5kIHVwIGFjY2lkZW50YWxseSBsZWFraW5nIHRoaXMgbmV3CmRlZmF1bHQg
c2V0dGluZyB0byB0aGUgY2FsbGVyLgoKQWNrZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgoKVGhhbmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
