Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37C3606A31E
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zq7cPI53
Received: from list by lists.xenproject.org with outflank-mailman.1501592.1697648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005ZX-ES; Tue, 24 Nov 2026 23:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501592.1697648; Tue, 24 Nov 2026 23:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVzwV-0005ZB-A9; Tue, 24 Nov 2026 23:28:55 +0000
Received: by outflank-mailman (input) for mailman id 1501592;
 Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xVzwU-0005XB-M7
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 23:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVzwT-0050ZB-Tw; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061dae-bab6-0a2a0a5309dd-0a2a450193ba-4
 for <multiple-recipients>; Wed, 25 Nov 2026 00:28:53 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+8ed7664ba4dc972f2276+8493+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6b061c4c-5bcc-0a2a45010019-5a9b5cc797b8-3
 for <multiple-recipients>; Wed, 25 Nov 2026 00:22:53 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xVzqc-00000004eV2-1kzL; Tue, 24 Nov 2026 23:22:51 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xVzqZ-0000000062Q-24a5;
 Tue, 24 Nov 2026 23:22:47 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=MDCkWo+nHOFblog6Fg5H/nm5g/v+HbobXRCSG92qh9s=; b=Zq7cPI53+tBAGo6VNkPs4NDpZ2
	TwiyB2pDIjyTWWTbrV+195ZYzLUaIEKjeK/v0lRKzfM82s0fHTlTz+xSKU8kKOG89uYuhDw2/j/Op
	wOiP/Nc7S6N1ITosEx81Sjr78GWy3NN9p4CyO/OEvh+hD3nXqn9lf6lH+WLYjC2KQpBC8MXltG/0N
	ED+KkdlzSglKlu1LgcuSX1XEwo2BtaXW0O0izBXJUaBjkZK4J7LyXcWczg8h0jbItMmFs0ZE1Hz7f
	gyDJvEvcLyPy7C/gVnnYSmsNlHeNaoU1qAcl597E6U1PhZhgXBle4Su8Bnf8aCvUr99WgRy5dApgM
	bdtC5QVg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Hui Peng <benquike@gmail.com>,
	Mark Syms <mark.syms@citrix.com>,
	Feifan Qian <bea1e@proton.me>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v1 10/21] hw/i386/kvm/xen_evtchn: Reuse existing backend port in find_be_port()
Date: Tue, 24 Nov 2026 23:22:36 +0000
Message-ID: <20261124232247.23169-11-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124232247.23169-1-dwmw2@infradead.org>
References: <20261124232247.23169-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-d62444/1795562573-CBD495FD-555208FD/13/0
X-purgate-type: clean
X-purgate-size: 1517
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

After a guest soft reset, close_port() clears only the guest side of an
interdomain port; the backend handle still owns its be_handles[] slot.
Binding again then allocated a fresh slot each time, leaking the old
one — and leaving a dangling entry if the handle is later closed. Reuse
the slot the handle already owns.

Fixes: 794fba23a53a ("hw/xen: Add backend implementation of interdomain event channel support")
Reported-by: Hui Peng <benquike@gmail.com>
Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 7fd8c3f3182..e2803cad0a8 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -2052,6 +2052,16 @@ static int find_be_port(XenEvtchnState *s, struct xenevtchn_handle *xc)
 {
     int i;
 
+    /*
+     * A handle may still own a backend port from before a guest soft reset;
+     * close_port() clears only the guest side. Reuse it rather than leaking
+     * the old slot and allocating a second one.
+     */
+    if (xc->be_port && xc->be_port < EVTCHN_2L_NR_CHANNELS &&
+        s->be_handles[xc->be_port] == xc) {
+        return xc->be_port;
+    }
+
     for (i = 1; i < EVTCHN_2L_NR_CHANNELS; i++) {
         if (!s->be_handles[i]) {
             s->be_handles[i] = xc;
-- 
2.43.0


