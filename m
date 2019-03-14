From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 16:03:39 +0100
Message-ID: <9bf87f08-5544-60f9-0455-48ca99c23ba3@suse.com>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190314145003.36695ef4.olaf@aepfle.de>
 <cfd355b6-da0b-7e02-a484-cc8476a36198@suse.com>
 <20190314151416.625d8cfa.olaf@aepfle.de>
 <38e61ca1-7390-a942-8b41-eacca522bcb1@suse.com>
 <20190314153322.2fcf6808.olaf@aepfle.de>
 <945b7caf-bca6-9e02-f290-91c50f685fd3@suse.com>
 <20190314154637.5a5c0ef0.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=X/If=RR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h4RtX-0008N4-T0
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 15:03:43 +0000
In-Reply-To: <20190314154637.5a5c0ef0.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxNTo0NiwgT2xhZiBIZXJpbmcgd3JvdGU6Cj4gQW0gVGh1LCAxNCBNYXIg
MjAxOSAxNTozODo0OCArMDEwMAo+IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPjoKPiAKPj4gVjEwIHN0aWxsIGludm9sdmVkIGNoYW5nZXMgaW4gdGhlIGh5cGVydmlzb3Is
IHdoaWxlIG15IHByb3Bvc2FsIGlzIHRvb2xzCj4+IG9ubHkuCj4gCj4gT2gsIHlvdSBtZWFuIEkg
c2hvdWxkIGFkanVzdCB0aGUgdmFsdWUgdGhhdCBpcyBzdXBwb3NlZGx5IGV4cGVjdGVkIGJ5Cj4g
ZG9tVSB0byB0aGUgb25lIHRoZSBjdXJyZW50IGh5cGVydmlzb3IgaGFzLCBqdXN0IHRvIGJ5YmFz
cyB0aGUgY2hlY2sgaW4KPiB0c2Nfc2V0X2luZm8/IEkgbmV2ZXIgdGhvdWdodCBvZiBkb2luZyBp
dCB0aGF0IHdheS4gVGhlIGluaXRpYWwgdmFsdWUKPiB3aWxsIGJlIGxvc3QsIGlmIGl0IGlzIGRv
bmUgdGhhdCB3YXkuCgpUaGlzIHdvdWxkbid0IGJlIGEgbXVzdC4gWW91IGNvdWxkIHNhdmUgdGhl
IG9yaWdpbmFsIGZyZXF1ZW5jeSBpbgpYZW5zdG9yZSBhbmQgc2VuZCB0aGF0IHZhbHVlIHdoZW4g
bWlncmF0aW5nIGFnYWluLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
