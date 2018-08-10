From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 04/10] x86/paravirt: use a single ops
 structure
Date: Fri, 10 Aug 2018 14:30:19 +0200
Message-ID: <5048a84a-3d66-e6a6-002a-09602fc9a478__39353.3607748852$1533904156$gmane$org@suse.com>
References: =?UTF-8?Q?<20180810115252.18213=ef=bf=bd1=ef=bf=bdjgross@suse.co?=
 =?UTF-8?Q?m>_<20180810115252.18213-5-jgross@suse.com>_<5B6D7FB402000078001D?=
 =?UTF-8?Q?CF30@suse.com>?=
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xtjq=kz=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fo6Yo-0003fh-6P
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 12:30:30 +0000
In-Reply-To: <5B6D7FB402000078001D?= =?UTF-8?Q?CF30@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: rusty@rustcorp.com.au, the arch/x86 maintainers <x86@kernel.org>, Alok Kataria <akataria@vmware.com>, lkml <linux-kernel@vger.kernel.org>, Linux Virtualization <virtualization@lists.linux-foundation.org>, mingo@redhat.com, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDgvMTggMTQ6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDEwLjA4LjE4IGF0
IDEzOjUyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEvYXJjaC94ODYvaHlwZXJ2
L21tdS5jCj4+ICsrKyBiL2FyY2gveDg2L2h5cGVydi9tbXUuYwo+PiBAQCAtMjI4LDkgKzIyOCw5
IEBAIHZvaWQgaHlwZXJ2X3NldHVwX21tdV9vcHModm9pZCkKPj4gIAo+PiAgCWlmICghKG1zX2h5
cGVydi5oaW50cyAmIEhWX1g2NF9FWF9QUk9DRVNTT1JfTUFTS1NfUkVDT01NRU5ERUQpKSB7Cj4+
ICAJCXByX2luZm8oIlVzaW5nIGh5cGVyY2FsbCBmb3IgcmVtb3RlIFRMQiBmbHVzaFxuIik7Cj4+
IC0JCXB2X21tdV9vcHMuZmx1c2hfdGxiX290aGVycyA9IGh5cGVydl9mbHVzaF90bGJfb3RoZXJz
Owo+PiArCQlwdl9vcHMucHZfbW11X29wcy5mbHVzaF90bGJfb3RoZXJzID0gaHlwZXJ2X2ZsdXNo
X3RsYl9vdGhlcnM7Cj4gCj4gVGFraW5nIGp1c3QgdGhpcyBhcyBleGFtcGxlLCB3aHkgbm90Cj4g
Cj4gCQlwdl9vcHMubW11LmZsdXNoX3RsYl9vdGhlcnMgPSBoeXBlcnZfZmx1c2hfdGxiX290aGVy
czsKPiAKPiA/IEJvdGggcHZfIGFuZCBfb3BzIGFyZSByZWR1bmRhbnQgb24gdGhlIGZpZWxkIG5h
bWVzLgoKR29vZCBpZGVhLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
