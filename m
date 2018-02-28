From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/6] x86/hvm: Constify the read side of
 vlapic handling
Date: Wed, 28 Feb 2018 09:48:26 -0700
Message-ID: <5A96EB6A02000078001ACFAA@prv-mh.provo.novell.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-5-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBpbiBwcmVwYXJhdGlvbiB0byBtYWtlIGh2bV94MmFwaWNfbXNyX3JlYWQo
KSB0YWtlIGEgY29uc3QgdmNwdQo+IHBvaW50ZXIuICBPbmUgbW9kaWZpY2F0aW9uIGlzIHRvIGFs
dGVyIHZsYXBpY19nZXRfdG1jY3QoKSB0byBub3QgdXNlIAo+IGN1cnJlbnQuCj4gCj4gVGhpcyBp
biB0dXJuIG5lZWRzIGFuIGFsdGVyYXRpb24gdG8gaHZtX2dldF9ndWVzdF90aW1lX2ZpeGVkKCks
IHdoaWNoIGlzIHNhZmUKPiBiZWNhdXNlIHRoZSBvbmx5IG11dGFibGUgYWN0aW9uIGl0IG1ha2Vz
IGlzIHRvIHRha2UgdGhlIGRvbWFpbiBwbHQgbG9jay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
