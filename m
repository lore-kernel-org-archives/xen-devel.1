From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 0/5] xen/blk: persistent grant rework
Date: Fri, 24 Aug 2018 15:52:23 +0200
Message-ID: <8aaf02b1-999d-81fc-2732-ed556b959a8a__43677.846765104$1535118673$gmane$org@suse.com>
References: <20180813140114.20126-1-jgross@suse.com>
 <20180817155909.4cwiy6bhhgiala5m@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l5ae=lh=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ftCVm-0004A6-RV
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 13:52:26 +0000
In-Reply-To: <20180817155909.4cwiy6bhhgiala5m@mac>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDgvMTggMTc6NTksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gTW9uLCBBdWcg
MTMsIDIwMTggYXQgMDQ6MDE6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gUGVy
c2lzdGVudCBncmFudHMgYXJlIHVzZWQgaW4gdGhlIFhlbidzIGJsa2Zyb250L2Jsa2JhY2sgZHJp
dmVycyB0bwo+PiBhdm9pZCBtYXBwaW5nL3VubWFwcGluZyBvZiBJL08gYnVmZmVycyBpbiB0aGUg
YmFja2VuZCBmb3IgZWFjaCBJL08uCj4+Cj4+IFdoaWxlIHRoaXMgc3BlZWRzIHVwIHByb2Nlc3Np
bmcgcXVpdGUgYSBiaXQgdGhlcmUgYXJlIHByb2JsZW1zIHJlbGF0ZWQKPj4gdG8gcGVyc2lzdGVu
dCBncmFudHMgaW4gc29tZSBjb25maWd1cmF0aW9uczogZG9tYWlucyB3aXRoIG11bHRpcGxlCj4+
IGJsb2NrIGRldmljZXMgbWFraW5nIHVzZSBvZiBwZXJzaXN0ZW50IGdyYW50cyBtaWdodCBzdWZm
ZXIgZnJvbSBhIGxhY2sKPj4gb2YgZ3JhbnRzIGlmIGVhY2ggb2YgdGhlIGJsb2NrIGRldmljZXMg
ZXhwZXJpZW5jZWQgYSBoaWdoIEkvTyBsb2FkIGF0Cj4+IHNvbWUgdGltZS4gVGhpcyBpcyBkdWUg
dG8gdGhlIG51bWJlciBvZiBwZXJzaXN0ZW50IGdyYW50cyBwZXIgZGV2aWNlCj4+IG9ubHkgdG8g
YmUgbGltaXRlZCBieSBhIHJhdGhlciBoaWdoIG1heGltdW0gdmFsdWUsIGJ1dCBuZXZlciBiZWlu
Zwo+PiByZWxlYXNlZCBldmVuIGluIGNhc2Ugb2YgbG9uZ2VyIHRpbWVzIHdpdGhvdXQgYW55IEkv
Ty4KPj4KPj4gVGhpcyBzZXJpZXMgbW9kaWZpZXMgeGVuLWJsa2JhY2sgdG8gdW5tYXAgYW55IGRv
bVUgcGFnZSBtYXBwZWQgdmlhIGEKPj4gcGVyc2lzdGVudCBncmFudCBhZnRlciBhIHRpbWVvdXQg
KGRlZmF1bHQ6IDYwIHNlY29uZHMpLiBUaGUgdGltZW91dAo+PiBpcyBzZXQgdG8gaXRzIGRlZmF1
bHQgdmFsdWUgYWdhaW4gd2hlbiBhIHBlcnNpc3RlbnQgZ3JhbnQgaGFzIGJlZW4KPj4gdXNlZCBm
b3IgYW4gSS9PLgo+Pgo+PiB4ZW4tYmxrZnJvbnQgaXMgbW9kaWZpZWQgdG8gc2NhbiBldmVyeSAx
MCBzZWNvbmRzIGZvciBwZXJzaXN0ZW50IGdyYW50cwo+PiBub3QgaW4gdXNlIGJ5IGJsa2JhY2sg
YW55IG1vcmUgYW5kIHRvIHJlbW92ZSBzdWNoIGdyYW50cy4KPj4KPj4gVGhlIGxhc3QgMyBwYXRj
aGVzIGFyZSBzbWFsbCBjbGVhbnVwcyBvZiBibGtmcm9udCBhbmQgYmxrYmFjayBkcml2ZXJzLgo+
Pgo+PiBWMzoKPj4gLSBwYXRjaCAxOiBtYWtlIHRpbWVvdXQgcGFyYW1ldGVyIHN0YXRpYwo+IAo+
IEtvbnJhZCBpZiB5b3UgYXJlIE9LIHdpdGggdGhpcyBzZXJpZXMsIGNvdWxkIHlvdSBwbGVhc2Ug
c2VuZCBhIHB1bGwKPiByZXF1ZXN0IHRvIEplbnM/CgpQaW5nPwoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
