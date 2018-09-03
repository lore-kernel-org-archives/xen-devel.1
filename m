From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/5] xen/domain: Fold
 xsm_free_security_domain() paths together
Date: Mon, 3 Sep 2018 17:57:21 +0100
Message-ID: <20180903165721.vqmit2mgfuwobmll@zion.uk.xensource.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1535986020-15906-5-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMDM6NDY6NTlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiB4c21fZnJlZV9zZWN1cml0eV9kb21haW4oKSBpcyBpZGVtcG90ZW50IChib3RoIHRo
ZSBkdW1teSBoYW5kbGVyLCBhbmQgdGhlCj4gZmxhc2sgaGFuZGxlcikuICBNb3ZlIGl0IGludG8g
dGhlIHNoYXJlZCBfX2RvbWFpbl9kZXN0cm95KCkgcGF0aCwgYW5kIGRyb3AgdGhlCj4gSU5JVF94
c20gZmxhZyBmcm9tIGRvbWFpbl9jcmVhdGUoKQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
