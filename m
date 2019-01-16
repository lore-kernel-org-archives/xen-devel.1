From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3] xen: Fix x86 sched_clock() interface for
 xen
Date: Wed, 16 Jan 2019 08:17:03 -0500
Message-ID: <20190116131703.GB2793__40863.1637263626$1547644570$gmane$org@localhost.localdomain>
References: <20190114124413.3742-1-jgross@suse.com>
 <ebfc24e3-21a0-6cc6-ae68-5c13c1e66b9a@knorrie.org>
 <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HFAl=PY=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gjl4P-0003vF-Sw
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 13:17:25 +0000
Content-Disposition: inline
In-Reply-To: <4808225b-e413-2ec1-77a1-15999c18583f@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: sstabellini@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans van Kranenburg <hans@knorrie.org>, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, xen-devel@lists.xenproject.org, tglx@linutronix.de
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDg6NTA6MTNBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKCj4gQEAgLTE2NTAsMTMgKzE2NTAsMTQgQEAgdm9pZCB4ZW5fY2FsbGJhY2tfdmVjdG9y
KHZvaWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgeGVuX2hhdmVfdmVjdG9yX2NhbGxiYWNr
ID0gMDsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICAgICAgICAg
IH0KPiAtICAgICAgICAgICAgICAgcHJfaW5mbygiWGVuIEhWTSBjYWxsYmFjayB2ZWN0b3IgZm9y
IGV2ZW50IGRlbGl2ZXJ5IGlzCj4gZW5hYmxlZFxuIik7Cj4gKyAgICAgICAgICAgICAgIGlmICgh
c2lsZW50KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2luZm8oIlhlbiBIVk0gY2FsbGJh
Y2sgdmVjdG9yIGZvciBldmVudAo+IGRlbGl2ZXJ5IGlzIGVuYWJsZWRcbiIpOwoKSG93IGFib3V0
IHJlcGxhY2luZyBwcl9pbmZvKCkgd2l0aCBwcl9pbmZvX29uY2UoKT8KCi1ib3JpcwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
