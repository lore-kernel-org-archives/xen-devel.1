From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 04/10] x86/paravirt: use a single ops
 structure
Date: Fri, 10 Aug 2018 06:06:12 -0600
Message-ID: <5B6D7FB402000078001DCF30__47253.3991131515$1533902698$gmane$org@prv1-mh.provo.novell.com>
References: <20180810115252.18213-1-jgross@suse.com>
 <20180810115252.18213-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=aouf=kz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fo6BK-00019X-OX
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 12:06:14 +0000
In-Reply-To: <20180810115252.18213-5-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: rusty@rustcorp.com.au, the arch/x86 maintainers <x86@kernel.org>, Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org, Linux Virtualization <virtualization@lists.linux-foundation.org>, mingo@redhat.com, hpa@zytor.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA4LjE4IGF0IDEzOjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiAtLS0g
YS9hcmNoL3g4Ni9oeXBlcnYvbW11LmMKPiArKysgYi9hcmNoL3g4Ni9oeXBlcnYvbW11LmMKPiBA
QCAtMjI4LDkgKzIyOCw5IEBAIHZvaWQgaHlwZXJ2X3NldHVwX21tdV9vcHModm9pZCkKPiAgCj4g
IAlpZiAoIShtc19oeXBlcnYuaGludHMgJiBIVl9YNjRfRVhfUFJPQ0VTU09SX01BU0tTX1JFQ09N
TUVOREVEKSkgewo+ICAJCXByX2luZm8oIlVzaW5nIGh5cGVyY2FsbCBmb3IgcmVtb3RlIFRMQiBm
bHVzaFxuIik7Cj4gLQkJcHZfbW11X29wcy5mbHVzaF90bGJfb3RoZXJzID0gaHlwZXJ2X2ZsdXNo
X3RsYl9vdGhlcnM7Cj4gKwkJcHZfb3BzLnB2X21tdV9vcHMuZmx1c2hfdGxiX290aGVycyA9IGh5
cGVydl9mbHVzaF90bGJfb3RoZXJzOwoKVGFraW5nIGp1c3QgdGhpcyBhcyBleGFtcGxlLCB3aHkg
bm90CgoJCXB2X29wcy5tbXUuZmx1c2hfdGxiX290aGVycyA9IGh5cGVydl9mbHVzaF90bGJfb3Ro
ZXJzOwoKPyBCb3RoIHB2XyBhbmQgX29wcyBhcmUgcmVkdW5kYW50IG9uIHRoZSBmaWVsZCBuYW1l
cy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
