From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 0/2] x86/xen: avoid 32-bit writes to PTEs
 in PV PAE guests
Date: Mon, 27 Aug 2018 15:25:03 -0400
Message-ID: <4d75b6c7-124f-873c-f89a-fcbc9725054f__11922.7345371202$1535397768$gmane$org@oracle.com>
References: <20180821153755.30462-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=d5mw=lk=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fuN7I-0003ZK-6f
 for xen-devel@lists.xenproject.org; Mon, 27 Aug 2018 19:24:00 +0000
In-Reply-To: <20180821153755.30462-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, stable <stable@vger.kernel.org>, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMjEvMjAxOCAxMTozNyBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGlsZSB0aGUg
aHlwZXJ2aXNvciBlbXVsYXRlcyBwbGFpbiB3cml0ZXMgdG8gUFRFcyBoYXBwaWx5LCB0aGlzIGlz
Cj4gbXVjaCBzbG93ZXIgdGhhbiBpc3N1aW5nIGEgaHlwZXJjYWxsIGZvciBQVEUgbW9kaWZjYXRp
b25zLiBBbmQgd3JpdGluZwo+IGEgUFRFIHZpYSB0d28gMzItYml0IHdyaXRlIGluc3RydWN0aW9u
cyAoZXNwZWNpYWxseSB3aGVuIGNsZWFyaW5nIHRoZQo+IFBURSkgd2lsbCByZXN1bHQgaW4gYW4g
aW50ZXJtZWRpYXRlIEwxVEYgdnVsbmVyYWJsZSBQVEUuCj4KPiBXcml0ZXMgdG8gUEFFIFBURXMg
c2hvdWxkIGFsd2F5cyBiZSBkb25lIHdpdGggNjQtYml0IHdyaXRlcyBvciB2aWEKPiBoeXBlcmNh
bGxzLgo+Cj4gSnVlcmdlbiBHcm9zcyAoMik6Cj4gICB4ODYveGVuOiBkb24ndCB3cml0ZSBwdGVz
IGRpcmVjdGx5IGluIDMyLWJpdCBQViBndWVzdHMKPiAgIHg4Ni9wYWU6IHVzZSA2NCBiaXQgYXRv
bWljIHhjaGcgZnVuY3Rpb24gaW4gbmF0aXZlX3B0ZXBfZ2V0X2FuZF9jbGVhcgo+Cj4gIGFyY2gv
eDg2L2luY2x1ZGUvYXNtL3BndGFibGUtM2xldmVsLmggfCA3ICsrKy0tLS0KPiAgYXJjaC94ODYv
eGVuL21tdV9wdi5jICAgICAgICAgICAgICAgICB8IDcgKysrLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgoKCkFwcGxpZWQgdG8gZm9yLWxp
bnVzLTE5Yi4KCigrc3RhYmxlLikKCi1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
